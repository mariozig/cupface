class AddPolymorphicColumnsToFaces < ActiveRecord::Migration
  def change
    add_column :faces, :faceable_id, :integer
    add_index :faces, :faceable_id
    add_column :faces, :faceable_type, :string
  end
end
