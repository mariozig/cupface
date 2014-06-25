class AddKimonoIdToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :kimono_id, :string
  end
end
