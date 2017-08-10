class AddNameToUsers < ActiveRecord::Migration
  def change

    add_column :users, :name, :string, default: "Anonymous"
    add_column :users, :year_pass, :integer
    add_column :users, :branch, :string
    add_column :users, :company, :string

  end
end
