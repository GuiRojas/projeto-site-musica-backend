defmodule ProjetoSiteMusicaBackendWeb.UserController do
	alias ProjetoSiteMusicaBackend.Users
	use ProjetoSiteMusicaBackendWeb, :controller

	def register(conn, params = %{
		"first_name" => _first_name,
		"last_name" => _last_name,
		"email" => email,
		"password" => _password
	}) do

		with {:error, :not_found} <- Users.get_by_email(email),
			 {:ok, user} <- Users.create_user(params) do
			render(conn, "user.json", user: user)
		else
			{:ok, _user} -> Plug.Conn.send_resp(conn, 403, "Email already taken")
		end
	end

	def register(conn, _) do
		Plug.Conn.send_resp(conn, 403, "Incorrect parameters. Assure you are sending 'first_name', " <>
			"'last_name', 'email' and 'password'")
	end

	def login(conn, %{"email" => email, "password" => password}) do
		with {:ok, user} <- Users.get_by_email(email),
			 true <- Bcrypt.verify_pass(password, user.password) do

			render(conn, "login.json", user: user, logged: true)
		else
			{:error, :not_found} -> Plug.Conn.send_resp(conn, 404, "Incorrect email or password")
			false -> Plug.Conn.send_resp(conn, 404, "Incorrect email or password")
		end

	end

	def login(conn, _) do
		Plug.Conn.send_resp(conn, 403, "Incorrect parameters. Assure you are sending 'email' and 'password'")
	end
	
end