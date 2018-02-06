require 'rails_helper'

describe 'Belt' do
  it 'belongs to a kata' do
    kata = Kata.new(title: 'Kata potter', description: 'Pepe')
    kata.save

    belt = Belt.new(
      name: 'Bruce Lee',
      description: 'Bruce lee belt',
      kata_id: kata.id
    )
    belt.save

    expect(belt.kata.id).to eq(kata.id)
    expect(kata.belts).to eq([belt])
  end
end
