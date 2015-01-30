# encoding: utf-8

##
# Backup Generated: default
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t default [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://meskyanichi.github.io/backup
#
Model.new(:default, 'Description for default') do
  ##
  # Archive [Archive]
  #
  # Adding a file or directory (including sub-directories):
  #   archive.add "/path/to/a/file.rb"
  #   archive.add "/path/to/a/directory/"
  #
  # Excluding a file or directory (including sub-directories):
  #   archive.exclude "/path/to/an/excluded_file.rb"
  #   archive.exclude "/path/to/an/excluded_directory
  #
  # By default, relative paths will be relative to the directory
  # where `backup perform` is executed, and they will be expanded
  # to the root of the filesystem when added to the archive.
  #
  # If a `root` path is set, relative paths will be relative to the
  # given `root` path and will not be expanded when added to the archive.
  #
  #   archive.root '/path/to/archive/root'
  #
  archive :data do |archive|
    archive.add "/data"
  end

  ##
  # Amazon Simple Storage Service [Storage]
  #
  # store_with S3 do |s3|
  #   s3.access_key_id     = ENV["S3_ACCESS_KEY_ID"]
  #   s3.secret_access_key = ENV["S3_SECRET_ACCESS_KEY"]
  #   s3.region            = ENV["S3_REGION"]
  #   s3.bucket            = ENV["S3_BUCKET"]
  #   s3.path              = ENV["S3_BUCKET_PATH"]
  #   s3.keep              = ENV["S3_KEEP"] ? ENV["S3_KEEP"].to_i : 5
  #   s3.trunk_size        = ENV["S3_TRUNKSIZE"]  ? ENV["S3_TRUNKSIZE"].to_i 5
  # end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  ##
  # Mail [Notifier]
  #
  # The default delivery method for Mail Notifiers is 'SMTP'.
  # See the documentation for other delivery options.
  #
  notify_by Mail do |mail|
    mail.on_success           = true
    mail.on_warning           = true
    mail.on_failure           = true

    mail.from                 = "sender@email.com"
    mail.to                   = "receiver@email.com"
    mail.address              = "smtp.gmail.com"
    mail.port                 = 587
    mail.domain               = "your.host.name"
    mail.user_name            = "sender@email.com"
    mail.password             = "my_password"
    mail.authentication       = "plain"
    mail.encryption           = :starttls
  end

end
