defmodule ProjetoSiteMusicaBackendWeb.AlbumView do
	use ProjetoSiteMusicaBackendWeb, :view

	def render("albums.json", params = %{albums: _albums, songs: _songs}) do
		render_many(params, __MODULE__, "album.json")
	end

	def render("album.json", %{album: album, songs: songs}) do
		%{
			id: album.id,
			name: album.name,
			band: album.band,
			duration: album.duration,
			image_path: album.image_path,
		}
		|> Map.put(:songs, render_many(songs, ProjetoSiteMusicaBackendWeb.SongView, "song.json"))
	end

end