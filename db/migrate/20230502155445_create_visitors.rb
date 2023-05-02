class CreateVisitors < ActiveRecord::Migration[6.1]
  def change
    create_table :visitors do |t|
      t.references :long_to_short_url, null: false, foreign_key: true
      t.string :ip_address
      t.integer :counter, default: 0
      t.timestamps
    end
  end
end
