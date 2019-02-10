# BIG LIST

Big List is a ToDoList app without the ToDo's. It lets you keep track of interesting people and things. It's an attempt to use scraping to automate some of the tedium of clicking through links.


TODO:

Add notes to an item

Search Bar live filters results
Sort by category buttons
Add functionality to allow users to create categories and add icons for them

<% @items.each do |item| %>

  <%= link_to ItemPresenter.new(item).category, "#item-#{item.id}", id:"item-#{item.id}", class:"image-icon" %>

  <% if item.image %>
    <a href="/items/<%= item.id %>/edit" class="item-image">
      <img src="<%= item.image %>" alt="select"></img>
    </a>
  <% else %>
    <div><%= link_to '<i class="far fa-image"></i>'.html_safe, edit_item_path(item) %></div>
  <% end %>

  <div class="item-name" id="item-<%= item.id %>"><%= link_to item.name, item_path(item) %></div>

  <% if item.notes != [] %>
    <div class="item-notes">notes</div>
  <% else %>
    <div class="item-notes">-</div>
  <% end %>

<% end %>
