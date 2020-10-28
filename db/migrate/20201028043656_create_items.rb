class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,         null: false, default: ""
      t.text :description,    null: false
      t.integer :delivery_id, null: false
      t.integer :day_id,      null: false
      t.integer :price,       null: false
      t.integer :area_id,     null: false
      t.integer :status_id,   null: false
      t.integer :tag_id,      null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end