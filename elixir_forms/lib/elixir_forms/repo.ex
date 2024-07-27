defmodule ElixirForms.Repo do
  use Ecto.Repo,
    otp_app: :elixir_forms,
    adapter: Ecto.Adapters.SQLite3
end
