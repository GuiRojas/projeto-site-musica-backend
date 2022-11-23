defmodule ProjetoSiteMusicaBackend.Songs do
	alias ProjetoSiteMusicaBackend.{Repo, Song}
	import Ecto.Query
	
	def list_by_album(id) do
		songs =
			from(s in Song,
				where: s.album_id == ^id
			)
			|> Repo.all()

		case songs do
			nil -> {:error, :not_found}
			_ -> {:ok, songs}
		end
	end

	def create_song(params = %{
		"album_id" => _album_id,
		"duration" => _duration,
		"name" => _name
	}) do
		params
		|> Song.changeset
		|> Repo.insert
	end

end