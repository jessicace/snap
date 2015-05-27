class Photo < ActiveRecord::Base
  belongs_to :album
  acts_as_list scope: :album
  mount_uploader :image, ImageUploader
  validates :image, presence: true

  def next
    self.class.find_by(position: self.position + 1)
  end

  def previous
    self.class.find_by(position: self.position - 1)
  end
end
