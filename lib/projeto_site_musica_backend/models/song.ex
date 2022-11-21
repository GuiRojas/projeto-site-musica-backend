defmodule ProjetoSiteMusicaBackend.Song do
	alias ProjetoSiteMusicaBackend.Album
	use Ecto.Schema

	schema "songs" do
    	field :name, :string
    	field :duration, :string
    	belongs_to :album, Album
	end
end