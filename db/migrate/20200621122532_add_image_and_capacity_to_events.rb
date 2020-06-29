class AddImageAndCapacityToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :image_file_name, :string, default: ''
    add_column :events, :capacity, :integer, default: 1
  end
end
