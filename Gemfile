source "https://rubygems.org"

ruby RUBY_VERSION
DECIDIM_VERSION = "0.27.1"

gem "decidim", DECIDIM_VERSION

gem "bootsnap"
gem "puma"
gem "uglifier"#, "~> 4.1"
gem "aws-sdk-s3", require: false
gem "fog-aws"
gem "faker"#, "~> 1.9"
gem "delayed_job_active_record"

group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
end

group :development do
  gem "letter_opener_web"#, "~> 1.3"
  gem "listen"#, "~> 3.1"
  gem "spring"#, "~> 2.0"
  gem "spring-watcher-listen"#, "~> 2.0"
  gem "web-console"#, "~> 3.5"
end
