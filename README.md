# Personal finance manager
[![CI](https://github.com/yaroslavrick/my_money_app/actions/workflows/ci.yml/badge.svg)](https://github.com/yaroslavrick/my_money_app/actions/workflows/ci.yml)
[![Coverage](badge.svg)](https://github.com/yaroslavrick/my_money_app)

## Screenshots:

![Charts by category page](public/screenshots/by_category_chart.png)
![Charts by date page](public/screenshots/by_date_chart.png)
![Report by category generator page](public/screenshots/report_by_category_generator_page.png.png)
![Report by category generator page](public/screenshots/report_by_date_generator_page.png)
![Operations page](public/screenshots/operations_page.png)
![Categories page](public/screenshots/categories_page.png)

### Requirements

- Ruby 3.4.7
- Rails 7.2.2

#### 1. Clone the repository

```zsh
https://github.com/yaroslavrick/my_money_app
cd finance_app
```

#### 2. Copy the .env.example file.

```zsh
cp .env.example .env
```

#### 3. Install ruby and dependencies

##### Install `asdf`

Install `asdf` for version management:

```zsh
brew install asdf
```

```zsh
# Use a shortcut to configure your shell to use asdf:
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.zshrc
echo 'export PATH="${HOME}/.asdf/shims:${PATH}"' >> ~/.zshrc
```

```zsh
# Check the ~/.zshrc file for configuration commands
cat ~/.zshrc
```

```zsh
# On Mac M1/M2/M3: . /opt/homebrew/opt/asdf/libexec/asdf.sh
# For Mac Intel: . /usr/local/opt/asdf/asdf.sh

# Enable asdf to read .ruby-version files by adding to .asdfrc
echo "legacy_version_file = yes" >> ~/.asdfrc
```

```zsh
# SKIP IF RUST INSTALLED VIA HOMEBREW! Install the asdf plugin for rust:
asdf plugin-add rust
asdf install rust latest
asdf global rust latest

# Install the asdf plugin for Ruby:
asdf plugin add ruby
```

```zsh
# Install Ruby version 3.4.7
export RUBY_CONFIGURE_OPTS=--enable-yjit
asdf install ruby 3.4.7
# OPTIONAL check your ruby:
ruby --yjit -v
ruby --yjit -e "p RubyVM::YJIT.enabled?"
```

```zsh
# Add .tool-versions to your global .gitignore file

# Check if it exists with:
git config --global core.excludesfile
```

```zsh
# Modify it using:
code ~/.gitignore_global
# or
nano ~/.gitignore_global
```

```zsh
# Add .tool-versions file to the list
.tool-versions

# Check if it is added:
git config --global core.excludesfile ~/.gitignore_global
git config --global core.excludesfile
```

```zsh
bundle install
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

#### 5. Create and setup the database for development:

```zsh
bundle exec rails db:create && bundle exec rails db:migrate && bundle exec rails db:seed
```

#### 6. Start the app

```zsh
bundle exec rails s
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
