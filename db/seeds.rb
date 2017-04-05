##################
#WITH DATA STRUCTURE
##################
authors = [
  {
    name: "Margot Lee Shetterly",
    bio_link: "https://en.wikipedia.org/wiki/Roxane_Gay"
  },
  {
    name: "Sandi Metz",
    bio_link: "https://en.wikipedia.org/wiki/Sandi_Metz"
  },
  {
    name: "Octavia E. Butler",
    bio_link: "https://en.wikipedia.org/wiki/Octavia_E._Butler"
  }
]

authors.each do |author|
  Author.create(author)
end


  #note: rails db:reset will clear your data and seeds

##################
#WITH FAKER
##################
  #Add faker gem
  #Require faker gem
  # require 'faker'
  # #Go nuts
  #
  # 100.times do
  #   Author.create(name: Faker::Name.name)
  # end
  #Faker::HeyArnold.quote
  #Faker::HeyArnold.character




##################
#WITH CSV
##################


#https://gist.github.com/arjunvenkat/1115bc41bf395a162084

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'authors.csv'))

csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  author = Author.new
  author.name = row['name']
  author.bio_link = row['bio']
  author.save
end
