defmodule BlogWeb.PostController do
  use BlogWeb, :controller



  def index(conn, _params) do
    posts = [
      %{id: 1, titulo: "Phoenix"},
      %{id: 2, titulo: "Liveview"},
      %{id: 3, titulo: "Postgres"}
  ]
    render(conn, "post.html",posts: posts)
  end
  def show(conn, _params) do

    render(conn, "show.html")
  end
end
