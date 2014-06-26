class AddImageColumnsToFace < ActiveRecord::Migration
  def self.up
    add_attachment :faces, :image
  end

  def self.down
    remove_attachment :faces, :image
  end
end
