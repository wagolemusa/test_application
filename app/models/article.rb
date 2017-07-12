class Article < ActiveRecord::Base
	belongs_to :user
	has_many :article_categories # it was define when adding article categoies
	has_many :categories, through: :article_categories# it was define when adding article categoie

	validates :title, presence: true, length: { minimum: 3, maxinum: 50 }
	validates :description, presence: true, length: { minimum: 10, maximum: 300 }
	validates :user_id, presence: true

end