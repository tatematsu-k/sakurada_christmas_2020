class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :user_follows, :user_id, false
    change_column_null :user_follow_unfollows, :user_follow_id, false
    change_column_null :user_gift_requestings, :user_id, false
    change_column_null :user_gift_requesting_group_message_usings, :user_gift_requesting_id, false
    change_column_null :user_gift_requesting_group_message_usings, :user_text_message_id, false
    change_column_null :user_gift_requesting_private_message_usings, :user_gift_requesting_id, false
    change_column_null :user_gift_requesting_private_message_usings, :user_text_message_id, false
    change_column_null :user_infos, :user_id, false
    change_column_null :user_infos, :name, false
  end
end
