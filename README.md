# RailsSortable

RailsSortable is a simple Rails gem that allows you to create a listing view with drag & drop sorting. The arranged order will be persisted in the table without any pain.

![RailsSortable](https://raw.githubusercontent.com/itmammoth/rails_sortable/master/rails_sortable.gif "RailsSortable")

## Setup

Add it to your Gemfile then run bundle to install it.
```
gem 'jquery-ui-rails'
gem 'rails_sortable'
```

And then add it to the Asset Pipeline in the application.js file:
```
//= require jquery-ui/widgets/sortable
//= require rails_sortable
```

## Usage

RailsSortable requires a specific column on the ActiveRecord Model for its implementation.

For instance, the following migration indicates the case that you are attemtting to make `Item` model sortable.

```ruby
class CreateItems < ActiveRecord::Migration
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
class Item < ActiveRecord::Base
  include RailsSortable::Model
  set_sortable :sort  # indicate sort column
  # If you do not want timestamps to be updated on sorting, use following option. 
  # set_sortable :sort, silence_recording_timestamps: true
end
```

and the listing view (typically - index.html.erb) as
```erb
...
<tbody class="sortable">  <!-- sortable target -->
    <% sortable_fetch(@items) do |item, id_tag| %>  <!-- RailsSortable helper -->
      <tr id="<%= id_tag %>">  <!-- you must write it -->
        <td><%= item.title %></td>
        <td><%= item.sort %></td>
        <td><%= link_to 'Show', item %></td>
        <td><%= link_to 'Edit', edit_item_path(item) %></td>
        <td><%= link_to 'Destroy', item, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>
...
```

finally, apply sortable with Javascript.

```coffeescript
jQuery ->
  $(".sortable").railsSortable()
```

## Javascript options
jQuery plugin `railsSortable` is just a wrapper of `jquery.ui.sortable`. therefore it accepts all of `sortbale` options.

see the [http://api.jqueryui.com/sortable/](http://api.jqueryui.com/sortable/) to get detail.
