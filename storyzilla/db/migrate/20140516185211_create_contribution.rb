class CreateContribution < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.text :body
      t.belongs_to :user, index: true
      t.belongs_to :story, index: true
      t.belongs_to :contribution, index: true
      t.timestamps
    end
  end
end
