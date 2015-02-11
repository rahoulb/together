class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.belongs_to :website
      t.string :name, null: false
      t.text :description
      t.timestamps null: false
    end

    add_attachment :sections, :header_image

    add_index :sections, [:website_id, :name], unique: true
  end
end
