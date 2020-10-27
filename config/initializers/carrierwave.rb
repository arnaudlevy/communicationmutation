# frozen_string_literal: true

require "carrierwave/storage/fog"

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage :file
    config.asset_host = 'http://localhost:3000'
  else
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['AWS_S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_S3_SECRET_ACCESS_KEY'],
      region:                ENV['AWS_S3_REGION']
    }
    config.fog_directory = ENV['AWS_S3_BUCKET']
    config.fog_public = false
    config.fog_attributes = {
      'Cache-Control' => "max-age=#{365.day.to_i}",
      'X-Content-Type-Options' => "nosniff"
    }
  end
end
