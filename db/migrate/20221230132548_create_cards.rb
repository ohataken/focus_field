class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :id_hex, index: { unique: true }
      t.string :name
      t.string :card_generation
      t.integer :user_id, index: true
      t.datetime :finished_at

      t.timestamps
    end
  end
end
