defmodule ProjetoSiteMusicaBackend.Song do
	alias ProjetoSiteMusicaBackend.Album
	use Ecto.Schema

	schema "songs" do
    	field :name, :string
    	field :duration, :string
    	belongs_to :album, Album
	end

	def changeset(params) do
		fields = [
			:name,
			:duration,
			:album_id
		]

		%__MODULE__{}
		|> Ecto.Changeset.cast(params, fields)
	end
end