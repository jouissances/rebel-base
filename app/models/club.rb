# 1. Confirm relationships are appropriate

class Club < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    has_one :shelf, :dependent => :destroy
    has_many :books, through: :shelf, :dependent => :destroy
    has_many :discussions, through: :books, :dependent => :destroy
    has_many :comments, through: :discussions, :dependent => :destroy

    has_many :memberships, :dependent => :destroy
    has_many :users, through: :memberships, :dependent => :destroy

    acts_as_followable
    acts_as_likeable

    mount_uploader :club_image, AvatarUploader
    mount_uploader :cover_image, AvatarUploader

    validates_processing_of :club_image
    validates_processing_of :cover_image
    validate :image_size_validation

    validates :name, presence: {:message => 'cannot be blank, club cannot be saved.'}
    validates :genre, presence: {:message => 'cannot be blank, club cannot be saved.'}
    validates :subgenre, presence: {:message => 'cannot be blank, club cannot be saved.'}
    validates :description, presence: {:message => 'cannot be blank, club cannot be saved.'}

    
    def self.categorize_by(genre)
        Club.all.where(:genre => genre)
    end

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
