class Customer < ApplicationRecord
  include Webpage
  include HasUpload

  default_scope { order(:index, :name) }
  scope :active, -> { where(active: true) }
  scope :published, -> { where(published: true) }

  has_many :targets
  accepts_nested_attributes_for :targets,
                                allow_destroy: false
  has_many :feedbacks
  accepts_nested_attributes_for :feedbacks,
                                allow_destroy: false

  belongs_to :user

  mount_uploader :upload, CustomerUploader

  validates_presence_of :name
  validates_uniqueness_of :name

  paginates_per 2

end
