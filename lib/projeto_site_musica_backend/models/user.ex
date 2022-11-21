defmodule ProjetoSiteMusicaBackend.User do
	use Ecto.Schema

	schema "users" do
		field :first_name, :string
		field :last_name, :string
		field :email, :string
		field :password, :string, redact: true
	end
	
	def changeset(params) do
		fields = [
			:first_name,
			:last_name,
			:email,
			:password
		]

		%__MODULE__{}
		|> Ecto.Changeset.cast(params, fields)
		|> Ecto.Changeset.unique_constraint(:email)
	end

end