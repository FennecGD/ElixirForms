defmodule ElixirForms.QuestionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirForms.Questions` context.
  """

  @doc """
  Generate a question.
  """
  def question_fixture(attrs \\ %{}) do
    {:ok, question} =
      attrs
      |> Enum.into(%{
        no_answers: 42,
        question: "some question",
        yes_answers: 42
      })
      |> ElixirForms.Questions.create_question()

    question
  end
end
