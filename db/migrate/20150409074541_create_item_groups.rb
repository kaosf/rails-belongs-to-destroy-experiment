class CreateItemGroups < ActiveRecord::Migration
  def change
    create_table :item_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
