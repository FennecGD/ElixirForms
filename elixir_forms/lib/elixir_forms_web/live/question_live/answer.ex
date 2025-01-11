defmodule ElixirFormsWeb.QuestionLive.Answer do
  use ElixirFormsWeb, :live_view

  alias ElixirForms.Questions

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:question, Questions.get_question!(id))}
  end

  defp page_title(:answer), do: "Answer Question"
end
