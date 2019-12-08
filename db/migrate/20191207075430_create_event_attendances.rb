class CreateEventAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :event_attendances do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
    add_index :event_attendances, :user_id
    add_index :event_attendances, :event_id
    add_index :event_attendances, [:user_id, :event_id], unique: true
  end
end
