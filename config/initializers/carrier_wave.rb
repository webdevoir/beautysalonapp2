CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => Rails.application.secrets.S3_KEY,                        # required
      :aws_secret_access_key  => Rails.application.secrets.S3_SECRET,                        # required
      :region => Rails.application.secrets.S3_REGION
    }
    config.fog_directory  = 'beautysalon2'                     # required
  elsif Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    # config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"}
    config.aws_attributes = { :cache_control => 'max-age=315576000', :expires => 1.year.from_now.httpdate }

    # make sure our uploader is auto-loaded
    PromotionImageUploader
    TreatmentImageUploader
    ProductImageUploader
    SectionImageUploader
   

    # use different dirs when testing
    CarrierWave::Uploader::Base.descendants.each do |klass|
      next if klass.anonymous?
      klass.class_eval do
        def cache_dir
          "#{Rails.root}/spec/support/uploads/tmp"
        end

        def store_dir
          "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
        end
      end
    end
  else
    config.storage = :file
    config.enable_processing = Rails.env.production?
  end

end

