class Belt < ApplicationRecord
  belongs_to :kata

  def self.find_kata_id(id)
      belt = self.find(id)
      belt.kata.id
  end

  def self.full_kata(id)
    belt = self.find(id)
    "#{belt.name} #{belt.description}"
  end

  def inline
    "#{name} #{description}"
  end
end
