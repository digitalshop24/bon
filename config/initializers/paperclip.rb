Paperclip.interpolates(:s3_missing_url) do |attachment, style|
  "#{attachment.s3_protocol(style, true)}//#{attachment.s3_host_name}/#{attachment.bucket_name}/noimage/:class/:attachment/missing_#{style}"
end
Paperclip::Attachment.default_options.update(
  convert_options: { medium: '-quality 80 -strip', small: '-quality 80 -strip', thumb: '-quality 80 -strip' },
  storage: :s3,
  path: "/:class/:attachment/:id_partition/:style/:filename",
  s3_host_name: "s3-eu-central-1.amazonaws.com",
  url: ":s3_domain_url",
  default_url: ":s3_missing_url.jpg",
  s3_credentials: {
    bucket: Rails.application.secrets.aws["s3_bucket_name"],
    access_key_id: Rails.application.secrets.aws["access_key_id"],
    secret_access_key: Rails.application.secrets.aws["secret_access_key"],
  },
  s3_region: 'eu-central-1'
)
