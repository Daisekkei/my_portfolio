class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
   include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
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

#   #上限変更
#   process :resize_to_limit => [700, 700]

# #JPGで保存
#   process :convert => 'jpg'

# #サムネイルを生成
#   version :thumb do
#     process :resize_to_limit => [100, 100]
#   end

# # jpg,jpeg,gif,pngのみ
#   def extension_white_list
#     %w(jpg jpeg gif png)
#   end

# #ファイル名を変更し拡張子を同じにする
#   def filename
#     super.chomp(File.extname(super)) + '.jpg' 
#   end

# # # #日付で保存
  def filename
    if original_filename.present?
      time = Time.now
      name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
      name.downcase
    end
  end

# end

 
# S3にアップロードする場合
# 今回、S3は使わないので、コメントアウトした
# if Rails.env.production? || Rails.env.staging?
#   storage :fog
# else
#   storage :file
# end

# # S3のディレクトリ名
# def store_dir
#   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
# end

  # デフォルト画像は700x700に収まるようリサイズ
  process :resize_to_limit => [700, 700]

  # サムネイル画像
  version :thumb do
    process resize_to_fill: [100, 100]
  end

# 許可する画像の拡張子
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # 保存するファイルの命名規則
  # def filename
  #   "something.jpg" if original_filename
  # end

  # protected
  # # 一意となるトークンを作成
  # def secure_token
  #   var = :"@#{mounted_as}_secure_token"
  #   model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  # end

end