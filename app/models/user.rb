class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :photo
  
  has_many :collections, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship", :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  has_attached_file :photo,
                    :styles => {
                    :thumb => "25x25#",
                    :small=> "50x50#",
                    :medium=> "100x100#",
                    :large  => "300x300#" },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => "/:style/:id/:filename" 

  acts_as_authentic do |c|
    c.login_field = 'username'
  end

  #returns the relationship object IF this object is followed by the supplied user argument.                                                                                 
  def following?(user)
    relationships.find_by_followed_id(user)
  end

  #adds a relationship object with this user object and the one supplied in the argument.
  def follow!(user)
    relationships.create!(:followed_id => user.id)
  end

  #deletes a relationship object with this user object and the one supplied in the argument.
  def unfollow!(user)
     relationships.find_by_followed_id(user).destroy
  end

  #returns a boolean if this user object can be followed by the one supplied in the argument.
  def followable_by?(user)
    return false if self.id == user.id #can't follow self
    return false if user.following?(self) #can't follow someone already following
    true #otherwise 
  end

end