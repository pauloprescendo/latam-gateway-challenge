class Address < ApplicationRecord
  validates :zip, uniqueness: true, presence: true
end
