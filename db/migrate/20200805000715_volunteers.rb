class Volunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.string :firstname
      t.string :lastname
      t.string :password_digest
      t.integer :volunteer_id
      t.string :pronouns
      t.string :email
      t.boolean :training, default: false
      t.boolean :qtlgbt
      t.boolean :bipoc
      t.timestamps
    end
  end
end
