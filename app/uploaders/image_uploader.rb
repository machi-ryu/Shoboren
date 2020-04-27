class ImageUploader < CarrierWave::Uploader::Base

  def default_url(*args)
    ActionController::Base.helpers.asset_path([version_name, "default.png"].compact.join('_'))
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
