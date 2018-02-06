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

  it "retrieves its kata id" do
    kata = Kata.new(title: 'Kata potter', description: 'Pepe')
    kata.save

    belt = Belt.new(
      name:'name',
      description: 'Description',
      kata_id: kata.id
    )
    belt.save

    retrieved_kata_id = Belt.find_kata_id(belt.id)

    expect(retrieved_kata_id).to eq(kata.id)
  end
end
