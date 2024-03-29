class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true # Force version generation at upload time.

  process convert: 'jpg'

  version :thumnail do
    resize_to_fit 256, 256
  end

  version :avatar do
    cloudinary_transformation :width=>200, :height=>200, :gravity=>"faces", :radius=>"max", :crop=> :thumb, fetch_format: 'png', :zoom=>0.50

  end

  version :avatar_small do
    cloudinary_transformation transformation: [{ width: 800, height: 800, radius: :max, crop: :thumb },
                                               { width: 100, crop: :thumb },
                                               quality: "auto:best",
                                               fetch_format: :auto]
  end

  version :bright_face do
    cloudinary_transformation radius: 100,
                              width: 50, height: 50, crop: :thumb
  end

  version :low do
    cloudinary_transformation transformation: [quality: 'auto:low']
  end

  version :auto do
    cloudinary_transformation transformation: [quality: 'auto']
  end

  version :best do
    cloudinary_transformation transformation: [quality: 'auto:best']
  end
end

# Include RMagick or MiniMagick support:
# include CarrierWave::RMagick
# include CarrierWave::MiniMagick

# Choose what kind of storage to use for this uploader:
# storage :file
# storage :fog

# Override the directory where uploaded files will be stored.
# This is a sensible default for uploaders that are meant to be mounted:
# def store_dir
# "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
# end

# Provide a default URL as a default if there hasn't been a file uploaded:
# def default_url(*args)
#   # For Rails 3.1+ asset pipeline compatibility:
#   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
#
#   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
# end

# Process files as they are uploaded:
# process scale: [200, 300]
#
# def scale(width, height)
#   # do something
# end

# Create different versions of your uploaded files:
# version :thumb do
#   process resize_to_fit: [50, 50]
# end

# Add a white list of extensions which are allowed to be uploaded.
# For images you might use something like this:
# def extension_whitelist
#   %w(jpg jpeg gif png)
# end

# Override the filename of the uploaded files:
# Avoid using model.id or version_name here, see uploader/store.rb for details.
# def filename
#   "something.jpg" if original_filename
# end
