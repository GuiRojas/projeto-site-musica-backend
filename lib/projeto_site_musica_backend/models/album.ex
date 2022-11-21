defmodule ProjetoSiteMusicaBackend.Album do
	use Ecto.Schema

	schema "albums" do
    	field :name, :string
    	field :band, :string
    	field :duration, :string
    	field :image_path, :string
	end
end