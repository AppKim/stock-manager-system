Company.seed(:co_id) do |c|
  c.co_id = 1
  c.co_name = Faker::Company.name
  c.co_address = Faker::Address.full_address
  c.co_profile_img = Faker::Company.logo
end
