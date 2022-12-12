class CreateBabyfoodTags < ActiveRecord::Migration[6.1]
  def change
    create_table :babyfood_tags do |t|

      t.integer :babyfood_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
