class Project < ActiveRecord::Base
  attr_accessible :user_id, :title, :project_type, :client, :concept, :delivery_method, 
  								:street, :suite, :city, :state, :zip, :deadline, :return_by
  belongs_to :user
  has_many :submissions, :dependent => :destroy
  has_many :attachments, :dependent => :destroy
end
