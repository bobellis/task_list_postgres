require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('task_list path', {:type => :feature}) do
  it('show a page with a list of items to do, an input field, and a save button. On submit, will show a page with a confirmation message.') do
    visit('/')
    fill_in('description', :with => 'reticulate the spines')
    click_button('save_task')
    expect(page).to have_content("Task Saved.")
  end

end
