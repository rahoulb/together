class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :domain, null: false
      t.timestamps null: false
    end

    add_index :websites, :domain, unique: true
  end
end
