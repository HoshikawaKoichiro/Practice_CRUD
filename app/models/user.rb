class User < ApplicationRecord
  has_one :profile
  has_many :favorites
  has_many :books, through: :favorites
end
