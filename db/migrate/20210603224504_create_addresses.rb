class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :zip, null: false, index: { unique: true }
      t.string :street, null: false
      t.string :state
      t.string :city
      t.string :neighborhood
      t.string :complement

      t.timestamps
    end
  end
end
