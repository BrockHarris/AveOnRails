class Look < ActiveRecord::Base
  attr_accessible :collection_id, :description, :photo_file_name, :photo_file_size, :title, :photo
  belongs_to :collection
  has_attached_file :photo,
                    :styles => {
                    :thumb => "25x25#",
                    :small=> "50x50#",
                    :large  => "250x330#",
                    :full  => "500x500" },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => "/:style/:id/:filename" 
end
