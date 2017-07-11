class Category < ActiveRecord::Base
#validates :name, presence: true  # works on the first validation
validates :name, presence: true, length: { minimum: 3, maximum: 25 }# works on the first validation plus length
validates_uniqueness_of :name #works on the secand validation

end