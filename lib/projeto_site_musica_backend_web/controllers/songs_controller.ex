defmodule ProjetoSiteMusicaBackendWeb.SongController do
	alias ProjetoSiteMusicaBackend.{Albums, Songs}
	use ProjetoSiteMusicaBackendWeb, :controller

	def songs(conn, %{"id" => param_id}) do
		with {id, _} <- Integer.parse(param_id),
			 {:ok, album} <- Albums.get_by_id(id),
			 {:ok, songs} <- Songs.list_by_album(album.id) do
			render(conn, "songs.json", songs: songs)		
		else
			:error -> Plug.Conn.send_resp(conn, 403, "'id' parameter is not an Integer")
			{:error, :not_found} -> Plug.Conn.send_resp(conn, 404, "Album not found")
		end
	end

	def create(conn, params = %{
		"album_id" => album_id,
		"duration" => _duration,
		"name" => _name
	}) do
		with {:ok, _album} <- Albums.get_by_id(album_id),
			 {:ok, song} <- Songs.create_song(params) do
			render(conn, "song.json", song: song)		
		else
			{:error, :not_found} -> Plug.Conn.send_resp(conn, 404, "Album not found")
		end
	end

	def create(conn, _params), do: 
		Plug.Conn.send_resp(conn, 403, "Incorrect parameters. Assure you are sending " <>
			"'album_id', 'name' and 'duration'")

	def delete(conn, %{"id" => param_id}) do
		with {:ok, song} <- Songs.get_by_id(param_id),
			 {:ok, _} <- Songs.delete(song) do
			render(conn, "song.json", song: song)
		else
			{:error, :not_found} -> Plug.Conn.send_resp(conn, 404, "Song not found")
		end
	end

	def delete(conn,_), do: Plug.Conn.send_resp(conn, 403, "Missing 'id' parameter")

end