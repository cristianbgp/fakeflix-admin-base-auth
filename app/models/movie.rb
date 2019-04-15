class Movie < ApplicationRecord
  has_many :rentals, as: :rentable
  enum status: ["billboard", "preorder", "coming-soon" ]
end
