defmodule TgsnApi.Router do
  use Plug.Router
  use Plug.ErrorHandler

  alias TgsnApi.{Repo, User, Operation}

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :json],
    pass: ["*/*"],
    json_decoder: Poison
  )

  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Welcome")
  end

  # Gets existing user's info from database
  get "/user_id" do
    {:ok, user} = Query.get_user(conn.query_string)
    send_resp(conn, 200, inspect(user))
  end

  # Creates a new user in the database
  post "/signup" do
    Operation.create_user(conn.params)

    send_resp(conn, 200, "User created successfully.")
  end

  post "/login" do
    Operation.login(conn.body_params)

    send_resp(conn, 200, "Login successful!")
  end

  # If route does not exist,
  match _ do
    send_resp(conn, 404, "Not found")
  end

  def handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.inspect(kind, label: :kind)
    IO.inspect(reason, label: :reason)
    IO.inspect(stack, label: :stack)
    send_resp(conn, conn.status, "Something went wrong")
  end
end
