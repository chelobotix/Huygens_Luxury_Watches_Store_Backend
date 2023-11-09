require 'csv'

def price_to_numeral(str)
  str[0..-5].gsub(',', '').to_i
end

def create_img_array(quantity, type)
  array = []
  (1..quantity).each do |number|
    type == "image" ? array.push("#{number}.webp") : array.push("#{number}t.webp")
  end
  array
end

# seed begin

gender1 = Gender.create!(sex: "Male")
gender2 = Gender.create!(sex: "Female")

CSV.foreach('lib/seeds/brands.csv', headers: true, encoding: 'ISO-8859-1', col_sep: ';') do |row|
  Brand.create!(name: row['name'], description: row['description'], history: row['history'], logo: row['logo'])
end
