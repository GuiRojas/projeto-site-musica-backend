defmodule ProjetoSiteMusicaBackend.Users do
	alias ProjetoSiteMusicaBackend.{Repo, User}

	def get_by_email(email) do
		user = Repo.get_by(User, email: email)

		case user do
			nil -> {:error, :not_found}
			user -> {:ok, user}
		end
	end

	def create_user(params = %{
		"first_name" => _first_name,
		"last_name" => _last_name,
		"email" => _email,
		"password" => _password
	}) do
		params
		|> User.changeset()
		|> Repo.insert()
		|> IO.inspect()
	end
end