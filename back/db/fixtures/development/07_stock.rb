3.times do |n|
  Stock.seed(:st_id) do |s|
      s.st_id = n+1
      s.st_pr_id = 1
      s.st_exist = 1
      s.created_at = DateTime.new(2021,9,30,8)
      s.updated_at = DateTime.new(2021,9,30,8)
  end
end