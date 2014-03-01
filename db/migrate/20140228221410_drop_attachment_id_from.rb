class DropAttachmentIdFrom < ActiveRecord::Migration
  def change
       remove_column :contributions, :attachment_id
  end
end
