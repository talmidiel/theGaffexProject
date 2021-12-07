# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Article.destroy_all

# Table Users

user_first = User.create(email: "francis@gmail.com", password: "123456", first_name: "Francis", last_name: "Fake")
user_second = User.create(email: "hiprapenepo-8910@yopmail.com", password: "123456", first_name: "Chuck", last_name: "Norris")

# Table Articles

10.times do |article|
    article = Article.create(
        title: Faker::Movie.title,
        summary: Faker::Lorem.paragraph,
        introduction: Faker::Lorem.paragraph_by_chars,
        protocol: Faker::Lorem.paragraph_by_chars,
        results: Faker::Lorem.paragraph_by_chars,
        conclusion: Faker::Lorem.paragraph_by_chars,
        reference: Faker::Internet.url
        end
    )
end

# Table Tag

Article.all.each do |article|
    Tag.create (user: user_first, article: article, tag_name: ["Approuved", "Not Approuved", "Need Rewiew"].sample)
    Tag.create (user: user_second, article: article, tag_name: ["Approuved", "Not Approuved", "Need Rewiew"].sample)    
end
