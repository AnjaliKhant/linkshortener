class CreateLongToShortUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :long_to_short_urls do |t|
      t.string :original_url
      t.string :short_url
      t.timestamps
    end
  end
end
