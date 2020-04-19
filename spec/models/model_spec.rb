require 'rails_helper'

RSpec.describe ModelNameHere do

  describe 'relationships' do
    it {should belong_to (or) have_many :linked_table}
  end

  describe 'validations' do
    it {should validate_presence_of :attribute}
  end

end
