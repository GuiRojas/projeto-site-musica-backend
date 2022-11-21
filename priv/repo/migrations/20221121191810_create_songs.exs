defmodule ProjetoSiteMusicaBackend.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :album_id, references(:albums)
      add :name, :string
      add :duration, :string
    end
  end
end
