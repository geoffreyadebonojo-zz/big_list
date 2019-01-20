films = [
  "They Might Be Giants",
  "The Girl Upstairs",
  "Call Me By Your Name",
  "Robocop 2",
  "Robot and Frank",
  "Shadow of a Doubt",
  "Xtro",
  "My Beautiful Laundret",
  "What we do in the shadows",
  "Goon",
  "Ghostbusters",
  "Moonrise Kingdom",
  "The Endless",
  "A Face in the Crowd",
  "Mr. Smith Goes to Washington",
  "Nosferatu",
  "Ed Wood",
  "Annie Hall",
  "The Tribe",
  "Man with a Movie Camera",
  "The Third Man",
  "His Girl Friday",
  "Apocalypto",
  "The Void",
  "The Invasion (2007)",
  "The Visit",
  "The Lady Eve",
  "The Big Sleep",
  "Moon",
  "Melancholia",
  "Scent of a Woman",
  "Krampus",
  "Rififi",
  "Only Lovers Left Alive",
  "Locke",
  "Starred Up",
  "Short Term 12",
  "Paths of Glory",
  "Thin Red Line",
  "Jarhead",
  "Rosencrantz and Gildenstern are Dead",
  "Tokyo Story",
  "The Holy Mountain",
  "Dawn of the Planet of the Apes",
  "Low Blow",
  "Martin",
  "Zaat",
  "The Room",
  "Good Will Hunting",
  "Django Unchained",
  "North by Northwest",
  "Cleopatra",
  "Modern Times",
  "Cool Hand Luke",
  "The French Connection",
  "Young Frankenstein",
  "Sideways",
  "Spartacus",
  "American Werewolf in Paris",
  "Apollo 13",
  "Patton",
  "Spirited Away",
  "Raging Bull",
  "Strangers on a Train",
  "To have and have not",
  "Being John Malkovich",
  "Once upon a time in the West",
  "The Jazz Singer",
  "White Heat",
  "Dirty Harry",
  "Rushmore",
  "The Hudsucker Proxy",
  "Fiddler on the Roof",
  "Arsenic and Old Lace",
  "Spellbound",
  "The Secret of Kells",
  "Hard Boiled",
  "Sleuth",
  "Ship of Theseus",
  "the Dark Crystal",
  "This is Spinal Tap",
  "Dracula (1931)",
  "Crouching Tiger, Hidden Dragon",
  "The Cabinet of Dr.Caligari",
  "Metropolis",
  "Chinatown",
  "Rashomon",
  "Breathless",
  "The Seventh Seal",
  "Fargo",
  "Get Out",
  "Night Crawler",
  "Whiplash",
  "Reanimator",
  "Freaks",
  "Eraserhead",
  "Pi",
  "SpaceCop",
  "Kill Squad",
  "Monsters",
  "Lost Highway",
  "The Pit",
  "It Follows",
  "True Stories",
  "Fright Night (original)",
  "A quiet Place",
  "The mountain between us"
]

directors = [
  "Hitchcock",
  "Jodorowsky",
  "Kubrick",
  "Tartakovsky",
  "Kurosawa Akira",
  "Ozu Yasujiro",
  "Richard Linklater",
  "Darren Aronofsky",
  "Daviv Lynch"
]

namespace :import do
  desc "imports data from a csv file"
  task :data => :environment do
    item_counter = 0
    films.each do |title|
      data = {name: title, category: "film", image: nil}
      item = Item.create!(data)
      item_counter += 1 if item.persisted?
    end
    puts "Imported #{item_counter} films!"

    director_counter = 0
    directors.each do |name|
      data = {name: name, category: "person", image: nil}
      director = Item.create!(data)
      director_counter += 1 if director.persisted?
    end
    puts "Imported #{director_counter} directors!"
  end
end
