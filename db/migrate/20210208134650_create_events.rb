class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.datetime :event_date, null: false, defautl: ''
      t.string :name, null: false, default: ''
      t.integer :creator_id, null: false

      t.timestamps
    end

    add_index :events, [:event_date, :creator_id]
  end
end
