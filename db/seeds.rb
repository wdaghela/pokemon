# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def SeedData()
	require 'CSV'
		filePath = File.dirname(__FILE__) + '/pokemon.csv'
		file = File.open(filePath)
			csv = CSV.parse(file, headers: true, col_sep: ',')
			csv.each do |row|
				pokemon_hash = {}
				pokemon_hash[:name] = row['Name']
				pokemon_hash[:type1] = row['Type 1']
				pokemon_hash[:type2] = row['Type 2']
				pokemon_hash[:total] = row['Total'].to_i
				pokemon_hash[:hp] = row['HP'].to_i
				pokemon_hash[:attack] = row['Attack'].to_i
				pokemon_hash[:defense] = row['Defense'].to_i
				pokemon_hash[:spAttack] = row['Sp. Atk'].to_i
				pokemon_hash[:spDefense] = row['Sp. Def'].to_i
				pokemon_hash[:speed] = row['Speed'].to_i
				pokemon_hash[:generation] = row['Generation'].to_i
				pokemon_hash[:legendary] = row['Legendary'] == 'True' ? true : false
				Pokemon.create(pokemon_hash)
			end
end

SeedData()