class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email, null: false, index: true
      t.string :password_digest
      t.string :cpf, null: false, index: true
      t.string :phone, null: false, index: true
      t.date :birth_date, null: false

      t.timestamps
    end
  end
end
