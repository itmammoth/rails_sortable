# RailsSortable
[![Build Status](https://travis-ci.org/itmammoth/rails_sortable.svg?branch=use_travis_ci)](https://travis-ci.org/itmammoth/rails_sortable)

RailsSortable is a simple Rails gem that allows you to create a listing view with drag & drop sorting. The arranged order will be persisted in the table without any pain.

![RailsSortable](https://raw.githubusercontent.com/itmammoth/rails_sortable/master/rails_sortable.gif "RailsSortable")

# Setup

Add the following to your `Gemfile` then run bundle to install them.
```
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails_sortable'
```

And then add the following to the asset pipeline in the `application.js`:
```
//= require jquery
//= require jquery_ujs
//= require jquery-ui/widgets/sortable
//= require rails_sortable
```

# Usage

RailsSortable requires a specific column on the ActiveRecord Model for its implementation.

For instance, the following migration indicates the case that you are attempting to make `Item` model sortable.

```ruby
class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :sort  # for RailsSortable

      t.timestamps
    end
  end
end
```
and `Item` model as
```ruby
class Item < ApplicationRecord
  include RailsSortable::Model
  set_sortable :sort  # Indicate a sort column
  # without_updating_timestamps: true, # If you do NOT want timestamps to be updated on sorting
  # without_validations: true # If you do NOT want validations to be run on sorting

end
```
and `ItemsController` as
```ruby
class ItemsController < ApplicationController
  def index
    @items = Item.order(:sort).all
  end
end
```

and the listing view (typically - index.html.erb) as
```erb
...
<table>
  <tbody class="sortable">  <!-- sortable target -->
    <% @items.each_with_sortable_id do |item, sortable_id| %>
      <tr id="<%= sortable_id %>">  <!-- Needs id tag on sorting elements -->
        <td><%= item.title %></td>
        <td><%= item.sort %></td>
        <td><%= link_to 'Show', item %></td>
        <td><%= link_to 'Edit', edit_item_path(item) %></td>
        <td><%= link_to 'Destroy', item, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<!-- or just invoke model#sortable_id to get the id for sotable -->
...
<% @items.each do |item| %>
  <tr id="<%= item.sortable_id %>">
...
```

finally, apply sortable with Javascript.

```javascript
$(function() {
  $('.sortable').railsSortable();
});
```

## More
Please have a look at [Use cases@wiki](https://github.com/itmammoth/rails_sortable/wiki#use-cases) for further information.

# Javascript options
jQuery plugin `railsSortable` is just a wrapper of `jquery.ui.sortable`. therefore it accepts all of `sortable` options.

see the [http://api.jqueryui.com/sortable/](http://api.jqueryui.com/sortable/) to get the details.

# Contribution

Fork it, then install required gems like below.
```bash
$ bundle install
```

Please give me a PR freely.

### Testing
```bash
# Test with a dummy application
$ spec/dummy/bin/rails db:migrate
$ spec/dummy/bin/rails s
# Insert test data
$ RAILS_ENV=test spec/dummy/bin/rails db:migrate
$ spec/dummy/bin/rails db:seed

# Run specs
$ bundle exec rspec
```

# Licence

MIT Licence.
