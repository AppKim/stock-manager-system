json.results do
  json.array!(@result) do |product|
      json.pr_id product[:pr_id]
      json.pr_ca_id product[:pr_ca_id]
      json.pr_br_id product[:pr_br_id]
      json.pr_us_id product[:pr_us_id]
      json.pr_price product[:pr_price]
      json.pr_barcode product[:pr_barcode]
      json.pr_img product[:pr_img]
      json.pr_expiration product[:pr_expiration]
end
end
