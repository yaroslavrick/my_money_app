

### My steps of doing task:

`rails new finance_app`  
`cd finance_app`

`rails g scaffold Category name:string description:string`  
`rails db:migrate`

`rails g scaffold Operation amount:decimal odate:datetime description:string category:references`  
`rails db:migrate`

в файлі `app/models/category.rb`

```ruby
    # Вказую у множині, так Rails зрзуміє, що в Category може бути багато Operations  
    has_many :operations  
```

в файлі `app/models/operation.rb`

```ruby
    belongs_to :category  
```