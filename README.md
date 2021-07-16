# rails web api

- `rails db:create RAILS_ENV=development`
- `rails g model User email:string password_digest:string role:integer`
- `rails db:migrate`
- `rails g controller api::v1::users`