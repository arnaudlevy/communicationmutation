# frozen_string_literal: true

# Default CarrierWave setup.
#
# CarrierWave.configure do |config|
#   config.permissions = 0o666
#   config.directory_permissions = 0o777
#   config.storage = :file
#   config.enable_processing = !Rails.env.test?
# end

# Setup CarrierWave to use Amazon S3. Add `gem "fog-aws" to your Gemfile.
#
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_S3_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_S3_SECRET_ACCESS_KEY'],
    region:                ENV['AWS_S3_REGION']#,                                       # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',                                  # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080'                      # optional, defaults to nil
  }
  # https://github.com/carrierwaveuploader/carrierwave/issues/2023
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = ENV['AWS_S3_BUCKET']                                 # required
  config.fog_public     = false                                               # optional, defaults to true
  config.fog_attributes = {
    'Cache-Control' => "max-age=#{365.day.to_i}",
    'X-Content-Type-Options' => "nosniff"
  }
end
