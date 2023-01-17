

## My steps of doing task:

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

### Adding validations (module 18):

Завдання цього модуля полягає в додаванні перевірок (валідації) на рівні моделей.
1. Для сутності Category (моделі) додати наступні перевірки:
   a. Назва категорії є обов’язковою властивістю і не може бути порожньою
   b. Назва категорії має бути унікальною (не може бути двох категорій з
   однаковими назвами)
   c. Опис категорії є обов’язковою властивістю (не nil)
2. Для сутності Operation додати наступні перевірки
   a. Сума операції – обов’язкова властивість, а також значення – число, яке
   більше за 0
   b. Дата операції – обов’язкова властивість
   c. Короткий опис – обов’язкова властивість

steps:

``