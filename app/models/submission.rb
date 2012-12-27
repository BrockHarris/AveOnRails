class Submission < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :project_id, :attachment_attributes, :photo
  belongs_to :user, :project
  has_many :attachments, :dependent => :destroy
  accepts_nested_attributes_for :attachments, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
end
