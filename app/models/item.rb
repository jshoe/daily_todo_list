class Item < ActiveRecord::Base
  has_many :entries
  belongs_to :user
  validates :user, :presence => true
end
