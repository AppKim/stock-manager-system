PRODUCT_NAMES = ["김치삼겹살", "비비고만두", "배고프다", "섞어국밥", "맥모닝" ]

5.times do |n|
  Product.seed(:pr_id) do |p|
    p.pr_id = n + 1
    p.pr_ca_id = 1
    p.pr_br_id =1 
    p.pr_us_id = 1
    p.pr_price = 10000 + n
    p.pr_barcode = "123123"
    p.pr_img = ""
    p.pr_expiration = DateTime.new(2021,12,30,8)
    p.pr_name = PRODUCT_NAMES[n]
  end
end
