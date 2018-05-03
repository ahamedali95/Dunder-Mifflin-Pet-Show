class Dog < ApplicationRecord
  has_many :employees

  def self.sort_dogs
    sorted = Dog.all.sort_by {|dog| dog.employees.length}
    sorted.reverse
  end
end
