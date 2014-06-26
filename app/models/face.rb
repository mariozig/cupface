class Face < ActiveRecord::Base
  belongs_to :match
  belongs_to :player

  def team
    player.team
  end
end
