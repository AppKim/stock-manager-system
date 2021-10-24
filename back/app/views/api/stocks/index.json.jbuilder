# json.results do
#    json.array!(@result) do |stock|
#        json.st_id stock[:st_id]
#        json.st_pr_id stock[:st_pr_id]
#        json.st_exist stock[:st_exist]
#        json.created_at stock[:created_at]
#        json.updated_at stock[:updated_at]
#    end
# end


json.array! @result, :st_id, :st_pr_id, :pr_ca_id, :br_name, :pr_price,  :count
