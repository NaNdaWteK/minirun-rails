require 'rails_helper'
require 'capybara'

describe 'Kata' do
  TITLE = 'Kata potter'
  DESCRIPTION = 'You can do it'
  UPDATED_TITLE = 'Kata Harry potter'
  UPDATED_DESCRIPTION = 'You can do it Harry'
  DEFAULT_TITLE = 'kata title'

  it "second kata is readed" do
    create_kata
    create_kata(title: TITLE, description: DESCRIPTION)
    visit root_path

    click_on(TITLE)

    expect(page).to have_content(TITLE)
    expect(page).to have_content(DESCRIPTION)
  end

  it "create new katas" do
    visit root_path
    click_on('New kata')

    fill_in(:kata_title, with: TITLE)
    fill_in(:kata_description, with: DESCRIPTION)
    click_on('Save')

    expect(page).to have_content(TITLE)
    expect(page).to have_content(DESCRIPTION)
  end

  it "update katas" do
    kata = create_kata
    visit root_path

    click_on('Edit')
    fill_in(:kata_title, with: UPDATED_TITLE)
    fill_in(:kata_description, with: UPDATED_DESCRIPTION)
    click_on('Save')
    visit root_path

    expect(page).to have_content(UPDATED_TITLE)
    expect(page).not_to have_content(DEFAULT_TITLE)
  end

  it "delete katas" do
    kata = create_kata
    visit root_path
    expect(page).to have_content(DEFAULT_TITLE)

    click_on('Delete')
    visit root_path

    expect(page).not_to have_content(kata.title)
  end
end

def create_kata(title: DEFAULT_TITLE, description: 'kata description')
  kata = Kata.new(title: title, description: description)
  kata.save
  kata
end
