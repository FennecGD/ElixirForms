defmodule ElixirForms.Questions.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :question, :string
    field :yes_answers, :integer
    field :no_answers, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :yes_answers, :no_answers])
    |> validate_required([:question, :yes_answers, :no_answers])
  end
end
