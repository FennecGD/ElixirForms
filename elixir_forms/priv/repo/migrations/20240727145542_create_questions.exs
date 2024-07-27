defmodule ElixirForms.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question, :string
      add :yes_answers, :integer
      add :no_answers, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
