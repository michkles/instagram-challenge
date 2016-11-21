require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been uploaded' do
    scenario 'should displaya a prompr to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do

  let!(:image){ Picture.create(title:'baboon') }

    scenario 'display pictures' do
      visit '/pictures'
      p  page.body
      click_link ''
      expect(page).to have_content('baboon')
    end

  end

  context 'creating pictures' do
    scenario 'user can add a picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Title', with: 'baboon'
      attach_file "picture[image]", "#{Rails.root}/spec/baboon.png"
      click_button 'Upload image'
      expect(page).to have_css("img[src*='baboon.png']")
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do

  let!(:image){ Picture.create(title:'baboon') }

    scenario 'lets a user view a restaurant' do
       visit '/pictures'
       click_link ''
       expect(page).to have_content 'baboon'
       expect(current_path).to eq "/pictures/#{image.id}"
    end
  end

  context 'deleting pictures' do

  before { Picture.create title: 'baboon' }

  scenario 'let a user delete a picture' do
   visit '/pictures'
   click_link ''
   click_link 'Delete baboon'
   expect(page).not_to have_content 'bab'
   expect(page).to have_content 'Picture deleted'
  end

end

end
