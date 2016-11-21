require 'rails_helper'

feature 'reviewing' do
  before { Picture.create title: 'baboo' }

  scenario 'allows users to leave a comment' do
     visit '/pictures'
     click_link ''
     click_link 'Comment '
     p page.body
     fill_in "Message", with: "cool"
     click_button 'Leave comment'
     click_link ''
     expect(page).to have_content('cool')
  end

end
