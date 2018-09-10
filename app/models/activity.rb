class Activity < ApplicationRecord
  include Webpage
  include HasAreas
  include HasImages

  has_ancestry orphan_strategy: :rootify,
               cache_depth: true

  default_scope { order(:ancestry, :index) }
  scope :published, -> { where(published: true) }
  scope :navigated, -> { where(published: true, navigated: true) }

  validates_presence_of :header, :content

  def name
    (label.blank? ? header : label).to_s
  end

  def select_options(ignore = nil)
    arr = []
    unless id == ignore
      arr.push ["#{'— ' * ancestry_depth } #{name}", id]
      children.each { |model| arr += model.select_options(ignore) }
    end
    arr
  end

  def self.select_options(ignore = nil)
    arr = []
    Activity.roots.each { |model| arr += model.select_options(ignore) }
    arr
  end

end
