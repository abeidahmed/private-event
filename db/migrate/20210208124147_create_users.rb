class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''

      t.timestamps
    end

    add_index :users, :name
  end
end
