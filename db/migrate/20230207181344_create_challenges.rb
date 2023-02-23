class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :name, null: false
      t.references :category, null: false, foreign_key: true
      t.integer :goal, default: 0
      t.integer :progress, default: 0
      t.date :ends_at

      t.timestamps
    end
  end
end
