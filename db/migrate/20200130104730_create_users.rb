class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :admin, default: false
      t.integer :level, default: 0
      t.integer :experience, default: 0
      t.integer :swapfont, default: 0
      t.datetime :last_login
      t.string :password_digest

      t.timestamps
    end
  end
end
