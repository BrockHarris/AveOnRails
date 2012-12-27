class Collection < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :looks_attributes, :photo
  belongs_to :user
  has_many :looks, :dependent => :destroy
  accepts_nested_attributes_for :looks, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
end
