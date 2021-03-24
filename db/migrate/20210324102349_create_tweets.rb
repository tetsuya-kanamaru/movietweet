class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :title, null: false
      t.string :content
      t.timestamps
    end
  end
end
