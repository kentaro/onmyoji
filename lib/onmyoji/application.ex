defmodule Onmyoji.Application do
  use Application

  @impl true
  def start(_type, _args) do
    [
      {Bandit, plug: Onmyoji.ChatGPT}
    ]
    |> Supervisor.start_link(
      strategy: :one_for_one,
      name: Onmyoji.Supervisor
    )
  end
end
