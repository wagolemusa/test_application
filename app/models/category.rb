class Category < ActiveRecord::Base
#validates :name, presence: true  # works on the first validation

has_many :article_categories # it was define when adding article categoie
has_many :articles, through: :article_categories # it was define when adding article categoie

validates :name, presence: true, length: { minimum: 3, maximum: 25 }# works on the first validation plus length
validates_uniqueness_of :name #works on the secand validation

end