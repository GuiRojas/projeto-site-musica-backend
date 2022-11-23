defmodule ProjetoSiteMusicaBackendWeb.AlbumController do
	alias ProjetoSiteMusicaBackend.Albums
	use ProjetoSiteMusicaBackendWeb, :controller

	def list(conn, params) do
		with {:ok, albums} <- Albums.list(params) do
			render(conn, "albums.json", albums: albums)
		end
	end

	def show(conn, %{"id" => param_id}) do
		with {id, _} <- Integer.parse(param_id),
			 {:ok, album} <- Albums.get_by_id(id) do
			render(conn, "album.json", album: album)
		else
			:error -> Plug.Conn.send_resp(conn, 403, "'id' parameter is not an Integer")
			{:ok, :not_found} -> Plug.Conn.send_resp(conn, 404, "Album not found")
		end
	end

	def show(conn, _), do: Plug.Conn.send_resp(conn, 403, "Missing 'id' parameter")

	def create(conn, params = %{
		"name" => name,
		"band" => band,
		"duration" => _duration,
		"image_path" => _image_path
	}) do
		with {:error, :not_found} <- Albums.get_by_name_and_band(name, band),
			 {:ok, album} <- Albums.create_album(params) do
			render(conn, "album.json", album: album)
		else
			{:ok, _user} -> Plug.Conn.send_resp(conn, 403, "Band already exists")

		end
	end

	def create(conn, _) do
		Plug.Conn.send_resp(conn, 403, "Incorrect parameters. Assure you are sending " <>
			"'name', 'band', 'duration' and 'image_path'")
	end
end