class Belt < ApplicationRecord
  belongs_to :kata

  def self.find_kata_id(id)
      belt = self.find(id)
      belt.kata.id
  end
end
