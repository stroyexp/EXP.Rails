class Target < ApplicationRecord
  include Webpage
  include HasAreas
  include HasImages

  IMPORTANTS = {
      '': 0,
      'Важный': 1,
      'Важнейший': 2
  }

  # default_scope { order(important: :desc, start_at: :asc, name: :asc) }
  scope :published, -> { where(published: true) }
  scope :important, -> { where(important: 1..2) }
  scope :weight, -> { order(important: :desc, start_at: :asc, name: :asc) }
  scope :sorted, -> { order(:index, :name) }

  belongs_to :customer

  validates_presence_of :name
  validates_uniqueness_of :name,
                          case_sensitive: false
  validates_inclusion_of :important,
                         in: 0..3

  paginates_per 2

  def cover
    images[0].upload unless images.empty?
  end

end
