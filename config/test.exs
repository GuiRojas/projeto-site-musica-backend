import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :projeto_site_musica_backend, ProjetoSiteMusicaBackend.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "projeto_site_musica_backend_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :projeto_site_musica_backend, ProjetoSiteMusicaBackendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "EDUtnWLkSYEHpK43I2BeBas0kyZk8iZjYgFVdSdtXea2wzyKyypJ1BhncS+k6s6H",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
