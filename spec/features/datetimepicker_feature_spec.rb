require 'rails_helper'

RSpec.describe 'Datetimepicker', type: :feature, js: true do
  let(:base_path) { '/posts' }
  let(:post) { create(:post) }
  let(:edit_path) { "#{base_path}/#{post.to_param}/edit" }

  before(:each) { visit(edit_path) }

  it { expect(current_path).to eq(edit_path) }
  it { expect(page.body).to have_css('input[data-behaviour="date_picker"]') }

  describe "picking a date" do
    let(:published_at_input) { find('#post_published_at') }

    before do
      # Open the datepicker
      find('input[data-behaviour="date_picker"]').click
      
      # Wait for the datetimepicker widget to appear
      expect(page).to have_css('.bootstrap-datetimepicker-widget', wait: 5)

      # Navigate to July 1, 2025 and select it
      within('.bootstrap-datetimepicker-widget') do
        # Go to year view
        find('.datepicker-days .picker-switch').click
        find('.datepicker-months .picker-switch').click
        
        # Select 2025
        find('.datepicker-years td span', text: '2024').click
        
        # Select July
        find('.datepicker-months td span', text: 'May').click
        
        # Select day 1
        all('.datepicker-days td.day:not(.old):not(.new)', text: '27').first.click
      end
    end

    it { expect(published_at_input.value).to eq("2024-05-27 10:01:19") }
  end
end