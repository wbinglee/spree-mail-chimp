Spree::AppConfiguration.class_eval do
  preference :mailchimp_double_opt_in, :boolean, default: true
  preference :mailchimp_send_welcome,  :boolean, default: true
  preference :mailchimp_send_notify,   :boolean, default: true
  preference :mailchimp_merge_vars,    :string,  default: ''
  preference :mailchimp_list_id,       :string
  preference :mailchimp_api_key,       :string
end
