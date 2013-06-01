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
        @mc_member = hominid.list_member_info(Spree::Config.get(:mailchimp_list_id), [ params[:email] ])['success'] == 1
      rescue Hominid::APIError => e
      end

      if @mc_member
        @errors << Spree.t(:that_address_is_already_subscribed)
      else
        begin
          hominid.list_subscribe(
            Spree::Config.get(:mailchimp_list_id),
            params[:email], { 'FNAME' => params[:fname], 'LNAME' => params[:lname], 'MMERGE3' => params[:mmerge3] },
            true,
            true,
            Spree::Config.get(:mailchimp_send_welcome)
          )
        rescue Hominid::APIError => e
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
end
