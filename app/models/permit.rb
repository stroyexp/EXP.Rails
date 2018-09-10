class Permit < ApplicationRecord
  include Webpage
  include HasImages

  default_scope { order(:index, :name) }
  scope :published, -> { where(published: true) }

  validates_presence_of :name, :number, :provider, :issue_at
  validates_uniqueness_of :number,
                          case_sensitive: false

  paginates_per 2

  def cover
    images[0].upload unless images.empty?
  end

end
