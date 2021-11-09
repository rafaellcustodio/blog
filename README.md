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
  * git push --set-upstream origin develop
  * git flow feature start blog-flow
  * git push --set-upstream origin feature/blog-flow  
  * git push               

## Arquivos de configuração

  * /config/dev.exs -  {:credo, "~> 1.4", only: [:dev, :test], runtime: false}
  * mix deps.get
  * mix credo gen.config
  * mix credo --strict(altere as sugestões do credo)
  * git push
  * /config/dev.exs - {:sobelow, "~> 0.8", only: :dev}
  * /config/dev.exs - {:excoveralls, "~> 0.10", only: :test},

  coveralls.json
{
    "skip_files": [
      "lib/blog/application.ex",
      "lib/blog/release.ex",
      "lib/blog_web.ex",
      "lib/blog_web/views/error_helpers.ex",
      "test/support/channel_case.ex",
      "test/support/data_case.ex", 
      "lib/blog_web/telemetry.ex"
    ],
    "coverage_options": {
      "treat_no_relevant_lines_as_covered": true,
      "output_dir": "cover/",
      "minimum_coverage": 50
    }
  }


.sobelow-conf​

[
  verbose: false,
  private: false,
  skip: false,
  router: "",
  exit: "false",
  format: "txt",
  out: "",
  threshold: "high",
  ignore: ["Config.CSP", "Config.HTTPS"],
  ignore_files: []
]

  * mix.exs:
    def project do
    [
      app: :blog,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      app: :excoveralls,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
      coveralls: :test,
      "coveralls.detail": :test,
      "coveralls.post": :test,
      "coveralls.html": :test]
    ]
  end

  * mix deps.get
  * mix coveralls.html
  * Cole no intervalo que deseja ignorar
    # coveralls-ignore-start
    # coveralls-ignore-stop

