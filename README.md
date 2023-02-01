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

#### steps:

in `app/models/category`:

```ruby
  validates :name, presence: true
  # Назва категорії має бути унікальною (не може бути двох категорій з
  #    однаковими назвами)
  validates :name, uniqueness: true
  # Опис категорії є обов’язковою властивістю (не nil)
  validates :description, presence: true
```

in `app/models/operation`:

```ruby
  #   Сума операції – обов’язкова властивість, а також значення – число, яке
  #    більше за 0
  validates :amount, presence: true, numericality: { greater_than: 0 }
  #   Дата операції – обов’язкова властивість
  validates :odate, presence: true
  #   Короткий опис – обов’язкова властивість
  validates :description, presence: true
```

## Завдання на проєкт (Модуль 19-20)

Завдання цього модуля полягає в створенні методів для формування звітів, а також
створення контролера для «головної сторінки»
Для забезпечення функціонування головної сторінки необхідно:

1. Створити контролер “Main” з action-методом index. При створені за допомогою
   генератора автоматично буде також створено шаблон для View, а також запис в
   параметрах маршрутизації config/routes.rb
2. У файлі config/routes.rb додати запис про root-маршрут в наступному форматі
   root “main#index”

#### STEPS:

```zsh
rails g controller Main index
```

in `config/routes.rb`:

```ruby
root "main#index"
```

Для роботи зі звітами на стороні клієнта необхідно:

1. Створити контролер “Reports” з action-методами index, report_by_category та
   report_by_dates
2. Найкраще створювати контролер за допомогою генератора, тим самим Rails
   автоматично створить шаблони для View, а також згенерує маршрути
3. Action-методи контролера Report мають наступне призначення
   Метод
   index
   Призначення
   Точка входу. Вивід форми генератора
   звітів
   report_by_category
   Звіт по категоріям
   report_by_dates
   Звіт по датам
4. Виклик action-методів report*by*\*\*\*\* потрібно забезпечити з форми генератора
   звітів. Для цього потрібно у шаблоні (view) report/index.html.erb зробити дві
   кнопки і прив’язати до них відповідні посилання (приблизний вигляд форми
   можна знайти в загальному завданні на проєкт «Персональний менеджер
   фінансів»)
5. Щодо реалізації логіки роботи action-методів report*by*\*\*\*\*a. Всередині методів необхідно забезпечити звернення до моделі Operation
   для отримання інформації з бази даних про витрати / доходи за деякий
   період часу в розрізі категорій. Зрозуміло, що використання щось на
   зразок @operations = Operation.all є надзвичайно небезпечним, тому що,
   якщо операцій в базі даних, наприклад буде декілька тисяч – це
   надзвичайно «великий» об’єм даних, які потрібно так чи інакше
   відфільтрувати.
   b. У файлі конфігурації маршрутів config/routes.rb прописати маршрути до
   всіх action-методів контролера Reports

```zsh
rails g controller Reports index report_by_category report_by_dates
```

`rails g model Activity atype:string`
`rails g scaffold Operation amount:decimal odate:datetime description:string category:references activity:references`

`rails db:rollback `
in `db/migrate/20230116103618_create_operations.rb`:

```ruby
   t.belongs_to :activity, index: true, foreign_key: true
   t.belongs_to :category, index: true, foreign_key: true
```

`rails db:migrate`

To [reset db](https://stackoverflow.com/questions/20464924/rails-migration-does-not-change-schema-rb) if needed :
```zsh
rake db:reset => db:drop db:create db:schema:load db:seed

To run all the migrations, use : rake db:drop db:create db:migrate

Or db:migrate:reset=> rake db:drop db:create db:migrate
```

TODO:
1. Add paginator([Kaminari](https://github.com/kaminari/kaminari))
2. Add canvas to reports results graphics ([ChartJS](https://www.chartjs.org/), [Chartkick](https://chartkick.com/)) 
3. Add `yurkovskiy` to collaborators 

### Adding Pagination (kaminari):

in `Gemfile`:

`gem 'kaminari'`

`bundle`

`rails g kaminari:config`


### Adding MiniTests:
in `test/models/category_test.rb`:

```ruby
  test"return false if name is missed" do
    new_category = Category.new(description: "Test description")
    assert_not(new_category.valid?)
  end

  test "return true if everything is okay" do
    new_category = Category.new(name: "Test name", description: "Test description")
    assert(new_category.valid?)
  end

  test "saving and gathering" do
    new_category = Category.new(name: "Test name", description: "Test description")
    new_category.save
    new_cat = Category.find_by(name: "Test name")
    assert_equal("Test description", new_cat.description)
  end
```
to run that particular test:

`rails test test/models/category_test.rb`