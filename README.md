# Personal finance manager
[![Coverage](badge.svg)](https://github.com/yaroslavrick/my_money_app)

### Requirements

- Ruby 3.1.2
- Rails 7.0.4

#### 1. Clone the repository

```zsh
https://github.com/yaroslavrick/my_money_app
cd finance_app
```

#### 2. Copy the .env.example file.

```zsh
cp .env.example .env
```

#### 3. Install dependencies

```zsh
bundle
```

#### 4. Setup Docker services (PostgreSQL and Redis):

```zsh
docker-compose up
```

Ensure that the ports configured in `.env` do not conflict with your running services.

Check the PID that use the port 5432:

`sudo lsof -i :5432`

If there is conflict:
Kill that PID:

`sudo kill <PID>`

`sudo service docker start`

`sudo systemctl stop redis postgresql`

`docker-compose up`

If you can't start docker, it can be problem with user permissions:
`sudo gpasswd -a <user> docker`
or:
`sudo usermod -aG docker $USER`

#### 5. Create and setup the database

```zsh
rails db:create && rails db:migrate && rails db:seed
```

#### 6. Start the app

```zsh
rails s
```

#### 7. Visit the app at localhost: http://localhost:3000

#### 8. Visit the app at web: https://financeapp-production.up.railway.app/

#### 9. Run RSpec tests:

```zsh
bundle exec rspec
```

## Testing

To run the test suite, use the following command:

```bash
bundle exec rspec
```

## Using Rswag

To view the API documentation, run the rails server and go to http://localhost:3000/api-docs

To create rswag file for new endpoint, run the following command:

```bash
bundle exec rails generate rspec:swagger API::MyControllerName
```

Then watch the file in spec/request/api/my_controller_name_spec.rb and add the test cases for the endpoint.

Generate documentation for the endpoint using:

```bash
bundle exec rake rswag:specs:swaggerize
```
