class Restaurant < ActiveRecord::Base

    mount_uploader :picture, PictureUploader
    mount_uploader :menu, MenuUploader 

    geocoded_by :address
    after_validation :geocode, :if => :address_changed?

end 