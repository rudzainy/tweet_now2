class Tweets < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  		t.string :tweet
  		t.timestamps null: false
  	end
  end
end
