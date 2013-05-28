class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  validates_length_of :title, :minimum => 5, :message => "more then 5 if you don't mind"
end
