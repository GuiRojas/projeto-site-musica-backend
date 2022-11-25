defmodule ProjetoSiteMusicaBackendWeb.AlbumView do
	use ProjetoSiteMusicaBackendWeb, :view

	defp single_album(album) do
		%{
			id: album.id,
			name: album.name,
			band: album.band,
			duration: album.duration,
			image_path: album.image_path,
		}
	end

	def render("albums.json", %{albums: albums}) do
		render_many(albums, __MODULE__, "album.json")
	end

	def render("album.json", %{album: album, songs: songs}) do
		single_album(album)
		|> Map.put(:songs, render_many(songs, ProjetoSiteMusicaBackendWeb.SongView, "song.json"))
	end

	def render("album.json", %{album: album}) do
		single_album(album)
	end

end