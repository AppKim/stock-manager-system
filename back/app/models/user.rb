class User < ApplicationRecord
  belongs_to :Role
  belongs_to :Company
end
