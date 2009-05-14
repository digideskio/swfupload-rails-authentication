class AddAttachmentsImageToAsset < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.references :user
    end
  end

  def self.down
    drop_table :assets
  end
end
