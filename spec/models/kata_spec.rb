require 'rails_helper'

describe 'Kata' do
  context 'Create' do
    it "needs fill title" do
      kata = Kata.new(
        title: nil,
        description: 'any'
      )
      
      kata.save
      
      expect(kata.errors.size).to eq(1)
    end
    it "needs fill description" do
      kata = Kata.new(
        title: 'any',
        description: nil
      )

      kata.save

      expect(kata.errors.size).to eq(1)
    end
  end
end
