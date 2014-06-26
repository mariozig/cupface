class AddCommentToFaces < ActiveRecord::Migration
  def change
    add_column :faces, :comment, :string
  end
end
