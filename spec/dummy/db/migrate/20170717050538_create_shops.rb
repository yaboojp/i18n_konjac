class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :ja_name
      t.string :fr_name

      t.timestamps null: false
    end
  end
end
