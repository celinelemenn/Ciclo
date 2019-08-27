class Like < ApplicationRecord
  belongs_to :point_of_interest
  belongs_to :user
end
