class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end
