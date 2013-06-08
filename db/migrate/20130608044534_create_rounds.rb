class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|

      t.integer :game_id
      t.integer :question_id
      t.timestamps
    end
  end
end
