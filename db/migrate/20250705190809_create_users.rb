class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest
      t.integer :role, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
