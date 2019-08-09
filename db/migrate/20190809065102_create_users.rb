class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
