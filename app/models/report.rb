class Report < ApplicationRecord
  belongs_to :point_of_interest
  belongs_to :user
end
