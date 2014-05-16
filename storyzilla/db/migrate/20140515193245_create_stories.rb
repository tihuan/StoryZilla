class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title, null: false
      t.text :beginning
      t.boolean :completion_status, default: false
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
