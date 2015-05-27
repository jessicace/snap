class Album < ActiveRecord::Base
  has_many :photos, -> { order(position: :asc) }
  accepts_nested_attributes_for :photos, allow_destroy: true
  
  extend FriendlyId
  friendly_id :title, :use => :slugged
  validates :title, presence: true
end
