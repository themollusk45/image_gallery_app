class AddAttachmentPicFileToPics < ActiveRecord::Migration
  def self.up
    change_table :pics do |t|
      t.attachment :pic_file
    end
  end

  def self.down
    drop_attached_file :pics, :pic_file
  end
end
