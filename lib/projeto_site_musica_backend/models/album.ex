defmodule ProjetoSiteMusicaBackend.Album do
	use Ecto.Schema

	schema "albums" do
    	field :name, :string
    	field :band, :string
    	field :duration, :string
    	field :image_path, :string
	end

	def changeset(album = %__MODULE__{}, params) do
		fields = [
			:name,
			:band,
			:duration,
			:image_path
		]

		album
		|> Ecto.Changeset.cast(params, fields)
	end
end