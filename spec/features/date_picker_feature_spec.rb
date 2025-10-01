require "rails_helper"

RSpec.describe "HTML5 Date Inputs", type: :feature do
  it "has the DatePickerInput class available" do
    expect(defined?(DatePickerInput)).to be_truthy
  end

  it "has the DateTimePickerInput class available" do
    expect(defined?(DateTimePickerInput)).to be_truthy
  end
end
