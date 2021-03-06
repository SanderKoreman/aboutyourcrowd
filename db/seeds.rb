# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require "prawn"

# Prawn::Document.generate("hello.pdf") do
#   text "Hello World!"
# end

require "CSV"

table = CSV.table('lib/assets/Hedonometer.csv')

table.sort_by{|s| s[:word]}


# table = table.select do |word|
#   word.word.start_with?("c")
# end
table_1 = []
table.select do |entry|
  if entry[:word][0] == "c"
    table_1 << entry[:word]
  end
end


puts table_1
