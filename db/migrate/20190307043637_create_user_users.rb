class CreateUserUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_users do |t|
      t.string :nickname, :null => false
      t.string :name, :null => false
      t.string :password_digest , :null => false
      t.string :email, :null => false
      t.timestamps
    end
  end
end
