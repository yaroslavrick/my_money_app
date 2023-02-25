# Personal finance manager
[![Coverage](badge.svg)](https://github.com/yaroslavrick/finance_app)

### Requirements

- Ruby 3.1.2
- Rails 7.0.4

#### 1. Clone the repository

```zsh
https://github.com/yaroslavrick/finance_app
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

#### 4. Create and setup the database

```zsh
rails db:create && rails db:migrate && rails db:seed
```

#### 5. Start the app

```zsh
rails s
```

#### 6. Visit the app at localhost: http://localhost:3000

#### 7. Visit the app at web:

#### 8. Run RSpec tests:

```zsh
bundle exec rspec
```

#### TODO:
- [x] Add `yurkovskiy` to collaborators
- [ ] Add `nromanen` to collaborators
