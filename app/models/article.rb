class Article < ApplicationRecord
  include Webpage
  include HasUpload

  default_scope { order(published: :desc, published_at: :desc, header: :asc) }
  scope :recent, -> (num) { order(published_at: :desc, header: :asc).limit(num) }
  scope :published, -> { where(published: true).order(published_at: :desc, header: :asc) }
  scope :unpublished, -> { where(published: false).order(published_at: :desc, header: :asc) }

  mount_uploader :upload, ArticleUploader

  validates_presence_of :header, :content
  validates_uniqueness_of :header,
                          scope: :published_at

  before_save :check_attributes

  paginates_per 2

  def to_s
    "#{I18n.t 'activerecord.models.article'} ##{id}"
  end

  def name
    to_s
  end


  private

  def check_attributes
    self.published_at = DateTime.now if self.published && self.published_at.blank?
  end

end
