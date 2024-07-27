defmodule ElixirForms.QuestionsTest do
  use ElixirForms.DataCase

  alias ElixirForms.Questions

  describe "questions" do
    alias ElixirForms.Questions.Question

    import ElixirForms.QuestionsFixtures

    @invalid_attrs %{question: nil, yes_answers: nil, no_answers: nil}

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Questions.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Questions.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      valid_attrs = %{question: "some question", yes_answers: 42, no_answers: 42}

      assert {:ok, %Question{} = question} = Questions.create_question(valid_attrs)
      assert question.question == "some question"
      assert question.yes_answers == 42
      assert question.no_answers == 42
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Questions.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      update_attrs = %{question: "some updated question", yes_answers: 43, no_answers: 43}

      assert {:ok, %Question{} = question} = Questions.update_question(question, update_attrs)
      assert question.question == "some updated question"
      assert question.yes_answers == 43
      assert question.no_answers == 43
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Questions.update_question(question, @invalid_attrs)
      assert question == Questions.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Questions.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Questions.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Questions.change_question(question)
    end
  end
end
