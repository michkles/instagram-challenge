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
    before do
      Picture.create(comment: 'me, me and me')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('me, me and me')
      expect(page).to have_content('picture uploaded successfully')
    end
  end

end
