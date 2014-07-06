class Face < ActiveRecord::Base
  belongs_to :match
  belongs_to :faceable, polymorphic: true

  has_attached_file :image, styles: { medium: '400x400>', thumb: '200x200>' }

  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  def team
    player.team
  end
end
