require 'rails_helper'

RSpec.describe 'HTML5 DateTime Inputs', type: :feature do
  let(:base_path) { '/posts' }
  let(:post) { create(:post) }
  let(:edit_path) { "#{base_path}/#{post.to_param}/edit" }

  before(:each) { visit(edit_path) }

  it 'renders HTML5 datetime-local input' do
    expect(page).to have_css('input[type="datetime-local"]')
  end

  it 'populates existing datetime values correctly' do
    input = find('input[type="datetime-local"]')
    # HTML5 datetime-local format: YYYY-MM-DDTHH:MM
    expect(input.value).to match(/\d{4}-\d{2}-\d{2}T\d{2}:\d{2}/)
  end

  it 'accepts datetime input' do
    input = find('input[type="datetime-local"]')
    input.fill_in with: '2024-12-25T14:30'
    
    expect(input.value).to eq('2024-12-25T14:30')
  end

  it 'has proper form attributes' do
    input = find('input[type="datetime-local"]')
    expect(input['name']).to eq('post[published_at]')
    expect(input['id']).to eq('post_published_at')
  end
end