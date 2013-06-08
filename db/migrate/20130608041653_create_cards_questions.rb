class CreateCardsQuestions < ActiveRecord::Migration
  def change
    create_table :cards_questions do |t|

      t.timestamps
    end
  end
end
