class Book < ApplicationRecord
  belongs_to :author
  has_many :favorites
  has_many :users, through: :favorites
end
