class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :game_id
      t.integer :question_id
      t.integer :answer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
