# Customer Autocomplete Demo

query a database table of Customers by first name, email, etc.

### installation

1. git clone `https://github.com/ryanckulp/customer_autocomplete_demo.git`
1. bundle (might need to install ruby version via `rbenv install 2.6.1` first)
3. `rails db:create && rails db:migrate && rails db:seed`
4. `rails s` then visit localhost:3000 and try it

### how it works

1. `keyup` JS listener on the input field pings search via `/customer_searches/new?query=X`
2. controller delegates search query to `Customer.search()`
3. `Customer.search()` performs case-insensitive search for "first_name" attribute only

### extensions

can include email address, last name, etc attributes in search parameters via modifications like...

```ruby
def self.search(params)
  results = where("first_name ILIKE '%#{params[:query]}%'")
  results += where("last_name ILIKE '%#{params[:query]}%'")
  results += where("email ILIKE '%#{params[:query]}%'")

  results.uniq.map { |c| { id: c.id, full_name: c.full_name } }
end
```
