require 'rails_helper'

RSpec.describe 'Datetimepicker', type: :feature, js: true do
  let(:base_path) { '/posts' }
  let(:post) { create(:post) }
  let(:edit_path) { "#{base_path}/#{post.to_param}/edit" }

  before(:each) { visit(edit_path) }

  it { expect(page.status_code).to eq(200) }
  it { expect(current_path).to eq(edit_path) }
  it { binding.pry; expect(page.body).to have_css('input[type="datetime-local"]') }
end