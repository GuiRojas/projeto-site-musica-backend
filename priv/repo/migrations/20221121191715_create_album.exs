defmodule ProjetoSiteMusicaBackend.Repo.Migrations.CreateAlbum do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :name, :string
      add :band, :string
      add :duration, :string
      add :image_path, :string
    end
  end
end
