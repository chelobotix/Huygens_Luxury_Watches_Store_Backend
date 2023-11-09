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



CSV.foreach('lib/seeds/watches.csv', headers: true, encoding: 'ISO-8859-1', col_sep: ';') do |row|
  price = price_to_numeral(row['price'])
  img_array = create_img_array(row['images'].to_i, "image")
  thumbnail_array = create_img_array(row['thumbnails'].to_i, "thumbnail")

  Watch.create!(brand_id: row['brand'], name: row['name'], price: price, reference: row['reference'], collection: row['collection'], movement: row['movement'], caliber: row['caliber'], powerReserve: row['powerReserve'], dateAdded: row['dateAdded'], dialColor: row['dialColor'], dialMaterial: row['dialMaterial'], caseSize: row['caseSize'], caseMaterial: row['caseMaterial'], caseBack: row['caseBack'], strapMaterial: row['strapMaterial'], strapColor: row['strapColor'], buckleType: row['buckleType'], specialFeatures: row['specialFeatures'], gender_id: row['gender'], video: row['video'], thumbnails: thumbnail_array, images: img_array  )
end
