require 'rails_helper'
require 'capybara'

describe 'Kata' do
  it "cam be readed" do
    kata_title = 'Kill nazis'
    kata_description = 'You can do it'
    kata = Kata.new(title: kata_title,
                    description:kata_description)
    kata.save

    visit root_path
    click_on(kata_title)
    
    expect(page).to have_content(kata_title)
    expect(page).to have_content(kata_description)
  end
end
