class InvitationsController < ApplicationController
	def create
		@invitation = Invitation.create(invitation_params)
        render json: { status: :ok }
	end
    def destroy
        @invitation = Invitation.find(params[:id])
        @invitation.destroy
    end
	private
	def invitation_params
    params.require(:invitation).permit(
        :name,
        :email,
        :message
    )
  	end
end
