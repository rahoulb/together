class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.belongs_to :section
      t.string :title, null: false
      t.text :excerpt
      t.timestamps null: false
    end

    add_attachment :pages, :header_iamge

    add_index :pages, [:section_id, :title], unique: true
  end
end
