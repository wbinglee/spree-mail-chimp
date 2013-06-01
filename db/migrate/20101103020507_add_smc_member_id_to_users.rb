class AddSmcMemberIdToUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :mailchimp_subscriber_id, :string, length: 31
  end
end
