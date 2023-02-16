class AddingProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.timestamps
      t.references :user
      
    end 
    
  end
end
