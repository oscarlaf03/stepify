class UserPhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
