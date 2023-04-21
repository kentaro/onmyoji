defmodule Onmyoji.ChatGPT do
  use Plug.Router

  plug Corsica,
    origins: ["http://localhost:4000", "https://chat.openai.com"],
    allow_headers: ~w(
      content-type
      openai-conversation-id
      openai-ephemeral-user-id
    )

  plug Plug.Static,
    at: "/",
    from: "assets"

  plug Plug.Parsers,
     parsers: [:json],
     pass:  ["application/json"],
     json_decoder: Jason

  plug :match
  plug :dispatch

  post "/commit" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{
      "result" => "OK",
      "prompt" => "Go ahead!",
    }))
  end

  match _ do
    IO.inspect conn.body_params
    send_resp(conn, 404, "404 Not Found")
  end
end
