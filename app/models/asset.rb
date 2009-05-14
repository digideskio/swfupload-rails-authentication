require 'mime/types'

class Asset < ActiveRecord::Base
  
  # Relationships
  belongs_to :user
                  
  has_attached_file :image, 
                    :styles => {:thumb => "150x150#"},
                    :whiny_thumbnails => true,
                    :url => "/asset_images/:style/:basename.:extension",
                    :path => ":rails_root/public/asset_images/:style/:basename.:extension"
  
  # Validations
  validates_attachment_content_type :image, 
                                    :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg'],
                                    :message => 'Picture must be a jpeg, tif or pdf file type'
  validates_attachment_size :image, :in => 1..5.megabyte
  
  attr_protected :image_file_name, :image_content_type, :image_size

  
  # Map file extensions to mime types.
  # Thanks to bug in Flash 8 the content type is always set to application/octet-stream.
  # From: http://blog.airbladesoftware.com/2007/8/8/uploading-files-with-swfupload
  def swf_uploaded_data=(data)
    data.content_type = MIME::Types.type_for(data.original_filename)
    self.image = data
  end
  
end