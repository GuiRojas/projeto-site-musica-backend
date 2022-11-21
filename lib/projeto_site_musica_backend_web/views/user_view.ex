defmodule ProjetoSiteMusicaBackendWeb.UserView do
	use ProjetoSiteMusicaBackendWeb, :view

	def render("login.json", %{user: user, logged: logged}) do
		%{
			logged_in: logged,
			user: render_one(user, __MODULE__, "user.json")
		}
	end

	def render("user.json", %{user: user}) do
		%{
			first_name: user.first_name,
			last_name: user.last_name,
			email: user.email,
		}
	end

end