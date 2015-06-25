require 'rails_helper'

feature "User adds an answer" do
  # As a user
  # I want to submit an answer to a question

  # Acceptance Criteria:

  # * Successfully add a new answer=>question relation in database and display.


  scenario 'add an answer to a question' do
    Question.create(title: "test", description: "test")
    Question.create(title: "test", description: "test")
    Question.create(title: "test", description: "test")
    visit '/questions/1'
    fill_in 'Answer', with: 'This is a test answer.  Blah blah blah.'
    click_button 'Submit'
    save_and_open_page
    expect(page).to have_content("This is a test answer")
  end
end