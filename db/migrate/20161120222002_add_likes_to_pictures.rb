class AddLikesToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :likes, :string
    add_column :pictures, :integer, :string
  end
end
