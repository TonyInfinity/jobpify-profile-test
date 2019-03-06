class Job < ActiveRecord::Base
    extend FriendlyId
    friendly_id :title, use: :slugged
    mount_uploader :avatar, AvatarUploader
    
    def self.search(search)
        if search
            where(['title LIKE ? or description LIKE ?', "%#{search}%", "%#{search}%"])
        else
            all
        end
    end
end
