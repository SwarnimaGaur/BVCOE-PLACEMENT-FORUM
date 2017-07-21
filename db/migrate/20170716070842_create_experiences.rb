class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :round_no
      t.string :content
      t.string :tips
     
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
