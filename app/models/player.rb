class Player < ActiveRecord::Base
  belongs_to :team
  has_many :faces, as: :faceable

  default_scope { order(:last_name) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
