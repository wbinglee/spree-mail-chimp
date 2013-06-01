class AddSubscriberColumnToUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :is_mail_list_subscriber, :boolean, null: false, default: false
  end
end
