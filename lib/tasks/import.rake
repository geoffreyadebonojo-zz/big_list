
films_path = File.join Rails.root, "data/films.rb"
films = File.read(films_path).split(",").map {|x| x.split('"')[1]}

persons_path = File.join Rails.root, "data/persons.rb"
persons = File.read(persons_path).split(",").map {|x| x.split('"')[1]}

documentaries_path = File.join Rails.root, "data/documentaries.rb"
documentaries = File.read(documentaries_path).split(",").map {|x| x.split('"')[1]}

books_path = File.join Rails.root, "data/books.rb"
books = File.read(books_path).split(",").map {|x| x.split('"')[1]}

resources_path = File.join Rails.root, "data/resources.rb"
resources = File.read(resources_path).split(",").map {|x| x.split('"')[1]}

topics_path = File.join Rails.root, "data/topics.rb"
topics = File.read(topics_path).split(",").map {|x| x.split('"')[1]}

namespace :db do
  desc "imports data from a csv file"
  task :data => :environment do
    item_counter = 0
    films.each do |title|
      data = {name: title, category: "film", image: nil}
      item = Item.create!(data)
      item_counter += 1 if item.persisted?
    end
    puts "Imported #{item_counter} films!"

    person_counter = 0
    persons.each do |name|
      data = {name: name, category: "person", image: nil}
      person = Item.create!(data)
      person_counter += 1 if person.persisted?
    end
    puts "Imported #{person_counter} persons!"

    documentary_counter = 0
    documentaries.each do |name|
      data = {name: name, category: "documentary", image: nil}
      documentary = Item.create!(data)
      documentary_counter += 1 if documentary.persisted?
    end
    puts "Imported #{documentary_counter} documentaries!"

    book_counter = 0
    books.each do |name|
      data = {name: name, category: "book", image: nil}
      book = Item.create!(data)
      book_counter += 1 if book.persisted?
    end
    puts "Imported #{book_counter} books!"

    resource_counter = 0
    resources.each do |name|
      data = {name: name, category: "resource", image: nil}
      resource = Item.create!(data)
      resource_counter += 1 if resource.persisted?
    end
    puts "Imported #{resource_counter} resources!"

    topic_counter = 0
    topics.each do |name|
      data = {name: name, category: "topic", image: nil}
      topic = Item.create!(data)
      topic_counter += 1 if topic.persisted?
    end
    puts "Imported #{topic_counter} topics!"
  end
end
