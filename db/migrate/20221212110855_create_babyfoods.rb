class CreateBabyfoods < ActiveRecord::Migration[6.1]
  def change
    create_table :babyfoods do |t|

      t.integer :customer_id
      t.string :title
      t.text :food
      t.text :point
      t.text :making

      t.timestamps
    end
  end
end
