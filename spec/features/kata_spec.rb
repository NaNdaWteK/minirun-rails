require 'rails_helper'
require 'capybara'

describe 'Kata' do
  it "second kata is readed" do
    kata_title = 'Kill nazis'
    kata_description = 'You can do it'
    create_kata
    create_kata(title: kata_title, description: kata_description)
    visit root_path
    click_on(kata_title)

    expect(page).to have_content(kata_title)
    expect(page).to have_content(kata_description)
  end

  it "create new katas" do
    kata_title = 'Kill nazis'
    kata_description = 'You can do it'

    visit root_path
    click_on('New kata')
    fill_in(:title, with: kata_title)
    fill_in(:description, with: kata_description)
    click_on('Save')
    
    expect(page).to have_content(kata_title)
    expect(page).to have_content(kata_description)
  end
end

def create_kata(title: 'kata title', description: 'kata description')
  kata = Kata.new(title: title, description: description)
  kata.save
  kata
end
