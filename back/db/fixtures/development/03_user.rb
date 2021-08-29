User.seed(:us_id) do |u|
  u.us_id = 1
  u.us_ro_id = 1
  u.us_co_id = 1
  u.us_login_id = Faker::Internet.email
  u.us_login_pw = 'password'
end
