class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :access_token
      t.boolean :verified
      t.string :urls
      t.string :location
      t.string :image
      t.string :gender

      t.timestamps
    end

  end
end
