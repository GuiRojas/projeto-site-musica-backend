defmodule ProjetoSiteMusicaBackendWeb.SongView do
	use ProjetoSiteMusicaBackendWeb, :view

	def render("songs.json", %{songs: songs}) do
		%{
			data: render_many(songs, __MODULE__, "song.json")
		}
	end

	def render("song.json", %{song: song}) do
		%{
			id: song.id,
			name: song.name,
			duration: song.duration,
			album_id: song.album_id,
		}
	end
end