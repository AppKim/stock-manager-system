json.results do
  json.array!(@result) do |item|
      json.pr_id item[:pr_id]
      json.pr_ca_id item[:pr_ca_id]
      json.pr_br_id item[:pr_br_id]
      json.pr_us_id item[:pr_us_id]
      json.pr_price item[:pr_price]
      json.pr_barcode item[:pr_barcode]
      json.pr_img item[:pr_img]
      json.pr_expiration item[:pr_expiration]
      json.br_name item[:br_name]
      json.ca_name item[:ca_name]
  end
end
