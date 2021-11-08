# Blog

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Docker 
  
  * docker rm $(docker ps -aq) - Remove as imagens docker
  * docker network remove pg - Remove a network postgres atual
  * sudo chmod 777 $HOME/docker/volumes/postgres - Caso esteja sem permissão 
  * sudo rm -rf $HOME/docker/volumes/postgres - Remove o diretório
  * docker network remove pg
  * docker network ls

  * docker network create --driver bridge pg
  * docker run --name pg --network=pg-net -e "POSTGRES_PASSWORD=postgres" -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data -d postgres
  
## Phoenix

  * mix ecto.create
  * mix phx.server
  * Explicando o funcionamento: 
    * As requisições entram por /lib/blog_web/router.ex
    * O método get redireciona o recurso "/" para a função "index" do módulo PageController
    * page_controller.ex recebe a requisição e implementa a função index que renderiza um html entre page_view e o template da pasta page
    * Resumindo: 
        request->router.ex (/lib/blog_web)
               ->page_controller.ex(/lib/blog_web/controllers), é aqui que podemos acessar dados no banco de dados para entregar para a view.
               ->page_view.ex (/lib/blog_web/views)
               ->index.html.eex(/lib/blog_web/templates/page)
  * `npm install` inside the `assets` directory
    
## Git

  * echo "# blog" >> README.md
  * git init
  * git add README.md
  * git commit -m "first commit"
  * git branch -M main
  * git remote add origin https://github.com/rafaellcustodio/blog.git 
  * git push -u origin main

  * git flow init

## Arquivos de configuração

  * /config/dev.exs - hostname: "pg"
