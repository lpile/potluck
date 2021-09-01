require 'rspec'
require './lib/dish'

describe Dish do
  before do
    @dish = Dish.new("Couscous Salad", :appetizer)
  end

  describe '#initialize' do
    it 'is an instance of dish' do
      expect(@dish).to be_a Dish
    end

    it 'is has attributes' do
      expect(@dish.name).to eq("Couscous Salad")
      expect(@dish.category).to eq(:appetizer)
    end
  end
end
