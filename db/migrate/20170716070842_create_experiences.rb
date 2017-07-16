class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :content
      t.string :tips
      t.numeric :round_no
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
