## Elixir / Erlang

  * wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
  * sudo apt-get update
  * sudo apt-get install esl-erlang
  * sudo apt-get install elixir


## Node

  * sudo apt update
  * sudo apt install nodejs
  * sudo apt install npm

## Phoenix Framework

  * mix local.hex
  * mix archive.install hex phx_new

## Inotify-tools

  * sudo apt update
  * sudo apt install inotify-tools

## Git

  * sudo apt-get install git-all    
  * sudo apt-get install git-flow
  * curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
  * echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  * sudo apt update
  * sudo apt install gh


## Visual Studio

  * sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  * wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  * sudo apt-get update
  * sudo apt-get install code

## Git Usage

  * gh auth login
  * rafaellcustodio@toolbox blog]$ gh auth login
  * What account do you want to log into? GitHub.com
  * What is your preferred protocol for Git operations? HTTPS
  * Authenticate Git with your GitHub credentials? Yes
  * How would you like to authenticate GitHub CLI? Login with a web browser
  * First copy your one-time code: 797A-E8AE
  * Press Enter to open github.com in your browser... 
  * Failed opening a web browser at https://github.com/login/device

## Blog

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
  
  * baixe e instale os binarios https://download.docker.com/linux/ubuntu/dists/
  * sudo usermod -a -G docker $USER - Se ocorrer erro de permisão

  * docker rm $(docker ps -aq) - Remove as imagens docker
  * docker network remove pg - Remove a network com nome pg
  * sudo chmod 777 $HOME/docker/volumes/postgres - Caso esteja sem permissão 
  * sudo rm -rf $HOME/docker/volumes/postgres - Remove o diretório
  
  * docker network remove pg
  * docker network ls
  * docker network create --driver bridge pg-net
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

  * git flow init (inicia e sugere nomes das 5 branchs- master, develop, feature, release, hotfix, suport)
  * git branch(exibe branchs atuais)
  * git flow feature start sum(cria a lane sum na branch feature)
  * git add .
  * git commit -m "funcionalidade soma criada"
  * git flow feature finish sum(quando terminar de codar na sum)
  * git flow realease start 0.1.0
  * git flow realease finish 0.1.0
    * obs - hotfix e release atualizam master e develop. 
    * obs - git checkout main - alterna branch  
    * obs - git merge main (estando na develop copia main para develop)             

## Credo, Coveralls e sobelow

  * /config/dev.exs -  {:credo, "~> 1.4", only: [:dev, :test], runtime: false}
  * mix deps.get
  * mix credo gen.config
  * mix credo --strict(altere as sugestões do credo)
  * git push
  * /config/dev.exs - {:sobelow, "~> 0.8", only: :dev}
  * /config/dev.exs - {:excoveralls, "~> 0.10", only: :test},

  * coveralls.json (cobertura)
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
    * coveralls-ignore-start
    * coveralls-ignore-stop

  * mix sobelow --config (segurança)

## MIT license

  * https://choosealicense.com/licenses/mit/

MIT License

Copyright (c) [year] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Changelog

  * https://keepachangelog.com/en/1.0.0/

  Changelog for v1.6
See the upgrade guide to upgrade from Phoenix 1.5.x.

Phoenix v1.6 requires Elixir v1.9+.

1.6.2 (2021-10-08)
Bug Fixes
[phx.new] Fix external flag to esbuild using incorrect syntax
1.6.1 (2021-10-08)
Enhancements
[phx.new] Add external flag to esbuild for fonts and image path loading
[phx.gen.auth] No longer set argon2 as the default hash algorithm for phx.gen.auth in favor of bcrypt for performance reasons on smaller hardware
Bug Fixes
Fix race conditions logging debug duplicate channel joins when no duplicate existed
JavaScript Client Bug Fixes
Export commonjs modules for backwards compatibility

## ci.yml

## Gigalixir

  * sudo apt-get update
  * sudo apt-get install -y python3 python3-pip git-core curl 
  * pip3 install gigalixir --user 
  * echo 'export PATH=~/.local/bin:$PATH' >> ~/.bash_profile   
  * source ~/.bash_profile        
  * gigalixir login
  * crie o app pelo site
  * gigalixir apps - verificar a aplicação
        rafaellcustodio@BIGUBUNTU:~/apps/blog$ gigalixir apps
      [
        {
          "cloud": "gcp",
          "region": "v2018-us-central1",
          "replicas": 0,
          "size": 0.3,
          "stack": "gigalixir-20",
          "unique_name": "blog-rafaellcustodio",
          "version": 2
        }
      ]
  * gigalixir pg:create --free -a blog-rafaellcustodio
  * mix phx.gen.secret
  * criar arquivo .env.sample
    * export SECRET_KEY_BASE=gwmjAnCBQ4VxUHxTQqTJ5BTKVp1894cl/6QooXke58QDpu0hrq7OlxN6GzrCBW3g
    * export DATABASE_URL=postgresql://6f18b651-6529-4803-aee0-0d02d5ca49c2-user:pw-6580bd08-f8da-4436-a786-6452ce364303@postgres-free-tier-v2020.gigalixir.com:5432/6f18b651-6529-4803-aee0-0d02d5ca49c2
  * source .env.sample