defmodule ProjetoSiteMusicaBackend.Repo do
  use Ecto.Repo,
    otp_app: :projeto_site_musica_backend,
    adapter: Ecto.Adapters.Postgres
end
