class AddReferenceToTweets < ActiveRecord::Migration[6.1]
  def change
    add_reference :tweets, :group, null: false, foreign_key: true
  end
end
