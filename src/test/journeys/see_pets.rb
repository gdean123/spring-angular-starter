require_relative 'spec_helper'

describe 'pets' do
  it 'shows pet names and ages' do
    visit('/')
    expect(page).to have_content 'Mr. Bun Bun Age 5'
  end
end