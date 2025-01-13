class CreateAnswes < ActiveRecord::Migration[7.0]
  def change
    create_table :answes do |t|
      t.string :name
      t.references :question, null: false, foreign_key: true
      t.string :user_token

      t.timestamps
    end
  end
end
