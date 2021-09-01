require 'rspec'
require './lib/dish'
require './lib/potluck'

describe Potluck do

  before do
    @couscous_salad = Dish.new("Couscous Salad", :appetizer)
    @summer_pizza = Dish.new("Summer Pizza", :appetizer)
    @roast_pork = Dish.new("Roast Pork", :entre)
    @cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    @candy_salad = Dish.new("Candy Salad", :dessert)
    @bean_dip = Dish.new("Bean Dip", :appetizer)
    @potluck = Potluck.new("7-13-18")
  end

  describe '#initialize' do
    it 'is an instance of potluck' do
      expect(@potluck).to be_a Potluck
    end

    it 'has attributes' do
      expect(@potluck.date).to eq("7-13-18")
      expect(@potluck.dishes).to eq([])
      expect(@potluck.menu).to eq({})
    end
  end

  describe '#add_dish' do
    it 'adds dish to dishes' do
      @potluck.add_dish(@couscous_salad)
      @potluck.add_dish(@cocktail_meatballs)

      expect(@potluck.dishes).to eq([@couscous_salad,@cocktail_meatballs])
      expect(@potluck.dishes.length).to eq(2)
    end
  end

  describe '#get_all_from_category' do
    it 'returns all dishes for appetizer' do
      @potluck.add_dish(@couscous_salad)
      @potluck.add_dish(@summer_pizza)
      @potluck.add_dish(@roast_pork)
      @potluck.add_dish(@cocktail_meatballs)
      @potluck.add_dish(@candy_salad)

      expect(@potluck.get_all_from_category(:appetizer)).to eq([@couscous_salad, @summer_pizza])
      expect(@potluck.get_all_from_category(:appetizer).first).to eq(@couscous_salad)
      expect(@potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
    end
  end

  describe '#menu' do
    it 'sorts menu by category' do
      @potluck.add_dish(@couscous_salad)
      @potluck.add_dish(@summer_pizza)
      @potluck.add_dish(@roast_pork)
      @potluck.add_dish(@cocktail_meatballs)
      @potluck.add_dish(@candy_salad)
      @potluck.add_dish(@bean_dip)
      menu = {:appetizers=>["Bean Dip", "Couscous Salad", "Summer Pizza"],:entres=>["Cocktail Meatballs", "Roast Pork"],:desserts=>["Candy Salad"]}

      expect(@potluck.menu).to eq(menu)
    end
  end

  describe '#ratio' do
    it 'returns the ratio for each category' do
      @potluck.add_dish(@couscous_salad)
      @potluck.add_dish(@summer_pizza)
      @potluck.add_dish(@roast_pork)
      @potluck.add_dish(@cocktail_meatballs)
      @potluck.add_dish(@candy_salad)
      @potluck.add_dish(@bean_dip)

      expect(@potluck.ratio(:appetizer)).to eq(50.0)
      expect(@potluck.ratio(:dessert)).to eq(16.7)
      expect(@potluck.ratio(:entre)).to eq(33.3)
    end
  end
end
