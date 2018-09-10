class Image < ApplicationRecord

  default_scope { order(:resource_type, :resource_id, :index, :title) }

  belongs_to :resource, polymorphic: true

  mount_uploader :upload, ImageUploader

  validates_presence_of :upload

  def to_s
    "#{I18n.t 'activerecord.models.image'} ##{id}"
  end

  def name
    title.blank? ? "#{I18n.t 'activerecord.models.image'} ##{id}" : title
  end

  def upload_recreate_versions
    if File.exist? upload.file.path
      upload.recreate_versions!
      1
    else
      delete
      0
    end
  end

  def self.upload_recreate_versions
    done = 0
    self.all.each { |model| done += model.upload_recreate_versions }
    done
  end

end
