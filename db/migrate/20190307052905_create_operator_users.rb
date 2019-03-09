class CreateOperatorUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :operator_users do |t|
      t.string :nickname, :null => false
      t.string :password_digest , :null => false
      t.timestamps
    end
  end
end
