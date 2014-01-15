# RailsSortable

RailsSortable is a simple Rails gem that allows you to create a listing view with drag & drop sorting.

see the video @YouTube

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/MpT3hiNVmsc/0.jpg)](http://www.youtube.com/watch?v=MpT3hiNVmsc)

## Setup

Add it to your Gemfile then run bundle to install it.
```
gem 'jquery-ui-rails'
gem 'rails_sortable'
```
* rails_sortable depends on jquery-ui-rails (~> 4.0)

And then add it to the Asset Pipeline in the application.js file:
```
//= require jquery.ui.sortable
//= require rails_sortable
```

## Usage

RailsSortable requires specific column on ActiveRecord Model for own implementation.

For instance, the following migration indicates the case that you are attemtting to make Item model sortable.

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
and Item model is
```ruby
class Item < ActiveRecord::Base
  include RailsSortable::Model
  set_sortable :sort
end
```

and its listing view (typically - index.html.erb) is
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

finally, you apply sortable with Javascript.

```coffeescript
jQuery ->
  $(".sortable").railsSortable()
```

## Option
jquery plugin `railsSortable` is just a wrapper `jquery.ui.sortable`. therefore it accepts all of `sortbale` options.

see the [http://api.jqueryui.com/sortable/](http://api.jqueryui.com/sortable/) to get detail.
