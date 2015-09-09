class TwitterUsers < ActiveRecord::Migration
  def change
  	create_table :twitter_users do |t|
  		t.string :handle
  		t.timestamps null: false
  	end
  end
end
