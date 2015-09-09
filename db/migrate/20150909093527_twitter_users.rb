class TwitterUsers < ActiveRecord::Migration
  def change
  	create_table :twitter_users do |t|
  		t.string :handle
  		t.string :name
  		t.string :token
  		t.string :token_secret
  		t.timestamps null: false
  	end
  end
end
