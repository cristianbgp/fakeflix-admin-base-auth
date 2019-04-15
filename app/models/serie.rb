class Serie < ApplicationRecord
  has_many :rentals, as: :rentable
  has_many :episodes, dependent: :delete_all
  enum status: ["billboard", "preorder", "coming-soon" ]
end
