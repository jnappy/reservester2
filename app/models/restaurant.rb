# == Schema Information
#
# Table name: restaurants
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text
#  address      :string(255)
#  phone_number :integer
#  created_at   :datetime
#  updated_at   :datetime
#  image        :string(255)
#  picture      :string(255)
#  menu         :string(255)
#  latitude     :float
#  longitude    :float
#

class Restaurant < ActiveRecord::Base

    mount_uploader :picture, PictureUploader
    mount_uploader :menu, MenuUploader 

    geocoded_by :address
    after_validation :geocode, :if => :address_changed?

    belongs_to :user    

end 
