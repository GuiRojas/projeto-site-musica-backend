defmodule ProjetoSiteMusicaBackend.Albums do
	alias ProjetoSiteMusicaBackend.{Repo, Album}
	import Ecto.Query
	
	defp search_query(query, %{"query" => term}) do
		q = "%" <> term <> "%"
		from(
			a in query,
			where: ilike(a.name, ^q),
			or_where: ilike(a.band, ^q)
		)
	end

	defp search_query(query, _), do: query

	defp paginate_query(query, params) do
		{size, _} = Map.get(params, "size", "8") |> Integer.parse()
		{page, _} = Map.get(params, "page", "1") |> Integer.parse()

		from(
			a in query,
			limit: ^size,
			offset: ^((page-1) * size)
		)
	end

	def list(params) do
		query =
			from(a in Album)
			|> search_query(params)
			|> paginate_query(params)

		{:ok, Repo.all(query)}
	end

	def get_by_id(id) do
		case Repo.get(Album, id) do
			nil -> {:error, :not_found}
			alb -> {:ok, alb}
		end
	end

	def get_by_name_and_band(name, band) do
		albums =
			from(a in Album,
				where: a.name == ^name and
					   a.band == ^band
			)
			|> Repo.all()

		case albums do
			nil -> {:error, :not_found}
			_ -> {:ok, albums}
		end
	end

	def create_album(params = %{
		"name" => _name,
		"band" => _band,
		"duration" => _duration,
		"image_path" => _image_path
	}) do		
		params
		|> Album.changeset()
		|> Repo.insert()
	end
end