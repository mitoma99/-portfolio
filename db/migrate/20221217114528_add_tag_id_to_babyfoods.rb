class AddTagIdToBabyfoods < ActiveRecord::Migration[6.1]
  def change
    add_column :babyfoods, :tag_id, :integer
  end
end
