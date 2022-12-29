class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :id_hex, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.string :timezone

      t.timestamps
    end
  end
end
