require 'rails_helper'

describe 'Belt' do
  before(:each) do
    @kata = Kata.new(title: 'Kata potter', description: 'Pepe')
    @kata.save

    @belt = Belt.new(
      name: 'Bruce Lee',
      description: 'Bruce lee belt',
      kata_id: @kata.id
    )
    @belt.save
  end

  it 'belongs to a kata' do
    expect(@belt.kata.id).to eq(@kata.id)
    expect(@kata.belts).to eq([@belt])
  end

  it "retrieves its kata id" do

    retrieved_kata_id = Belt.find_kata_id(@belt.id)

    expect(retrieved_kata_id).to eq(@kata.id)
  end

  it "retrieves name with its description" do

    full_kata = Belt.full_kata(@belt.id)

    expect(full_kata).to eq("#{@belt.name} #{@belt.description}")
  end
  it "retrieves name with its description" do
    expect(@belt.inline).to eq("#{@belt.name} #{@belt.description}")
  end
end
