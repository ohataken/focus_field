class CreateCardSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :card_sessions do |t|
      t.integer :user_id, index: true
      t.integer :card_id, index: true
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
