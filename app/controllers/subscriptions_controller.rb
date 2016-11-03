class SubscriptionsController < ApplicationController
	def create
		@subscription = Subscription.create(subscription_params)
  end

  def destroy
      @subscription = Subscription.find(params[:id])
      @subscription.destroy
      redirect_to subscriptions_main_path
  end

	private

	def subscription_params
    params.require(:subscription).permit(
        :email
    )
  end
end
