# 1. Confirm relationships are appropriate

class Club < ApplicationRecord
    has_one :shelf, :dependent => :destroy
    has_many :books, through: :shelf
    has_many :discussions, through: :books
    has_many :comments, through: :discussions

    has_many :memberships, :dependent => :destroy
    has_many :users, through: :memberships, :dependent => :destroy

    acts_as_followable
    acts_as_likeable

    mount_uploader :club_image, AvatarUploader
    mount_uploader :cover_image, AvatarUploader

    validates_processing_of :club_image
    validates_processing_of :cover_image
    validate :image_size_validation
    
    private

    def image_size_validation
        if club_image.size > 0.5.megabytes
            errors[:club_image] << "should be less than 500KB" 
        elsif
            cover_image.size > 0.5.megabytes
            errors[:cover_image] << "should be less than 500KB" 
        end
    end

end
