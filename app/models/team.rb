class Team < ActiveRecord::Base
  has_many :players

  default_scope { order(:name) }
end
