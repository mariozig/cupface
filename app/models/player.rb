class Player < ActiveRecord::Base
  belongs_to :team

  default_scope { order(:last_name) }
  def full_name
    "#{first_name} #{last_name}"
  end
end
