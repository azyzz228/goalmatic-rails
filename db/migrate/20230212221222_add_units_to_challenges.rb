class AddUnitsToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :units, :string
  end
end
