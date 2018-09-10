class Publish < ApplicationRecord
  include Webpage
  include HasAreas

  default_scope { order(published: :desc, published_at: :desc, header: :asc) }
  scope :recent, -> (num) { order(published_at: :desc, header: :asc).limit(num) }
  scope :published, -> { where(published: true).order(published_at: :desc, header: :asc) }
  scope :unpublished, -> { where(published: false).order(published_at: :desc, header: :asc) }

  validates_presence_of :header

  before_save :check_attributes

  paginates_per 2

  def to_s
    "#{I18n.t 'activerecord.models.publish'} ##{id}"
  end

  def name
    to_s
  end


  private

  def check_attributes
    self.published_at = DateTime.now if self.published && self.published_at.blank?
  end

end
