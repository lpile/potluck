class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
    @menu = {}
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.find_all{|dish| dish.category == category}
  end

  def menu
    @dishes.each {|dish| @menu[(dish.category.to_s + "s").to_sym] = []}
    @dishes.each {|dish| @menu[(dish.category.to_s + "s").to_sym] << dish.name}
    @menu.each {|k,v| v.sort!}
  end

  def ratio(category)
    ((get_all_from_category(category).length.to_f / @dishes.length) * 100).round(1)
  end
end
