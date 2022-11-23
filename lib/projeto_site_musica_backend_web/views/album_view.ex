defmodule ProjetoSiteMusicaBackendWeb.AlbumView do
	use ProjetoSiteMusicaBackendWeb, :view

	def render("albums.json", %{albums: albums}) do
		%{
			data: render_many(albums, __MODULE__, "album.json")
		}
	end

	def render("album.json", %{album: album}) do
		%{
			id: album.id,
			name: album.name,
			band: album.band,
			duration: album.duration,
			image_path: album.image_path,
		}
	end

end