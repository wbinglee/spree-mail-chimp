class Spree::SubscriptionsController < Spree::BaseController
  def hominid
    @hominid ||= Hominid::API.new(Spree::Config.get(:mailchimp_api_key))
  end

  def create
    @errors = []

    if params[:email].blank?
      @errors << Spree.t(:missing_email)
    elsif params[:email] !~ /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
      @errors << Spree.t(:invalid_email_address)
    else
      begin
        @mc_member = hominid.list_member_info(mailchimp_list_id, [params[:email]])
      rescue Hominid::APIError => e
          Rails.logger.error e.to_s
      end

     Rails.logger.debug "Mail list subscriber detail : #{@mc_member}"      

      if @mc_member['success']!=0 && @mc_member['data'][0]['status'] == 'subscribed'
        @errors << Spree.t(:that_address_is_already_subscribed)
      else
        begin
          hominid.list_subscribe(mailchimp_list_id, params[:email], {})
        rescue
          @errors << Spree.t(:invalid_email_address)
        end
      end
    end

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
      format.js   {          }
    end
  end

private

  def mailchimp_list_id
    @mailchimp_list_id ||= mailchimp_list_id_from_env || Spree::Config.get(:mailchimp_list_id)
  end

  def mailchimp_list_id_from_env
    ENV["MAILCHIMP_LIST_ID_#{I18n.locale.to_s.upcase}"]
  rescue
    nil
  end
end
