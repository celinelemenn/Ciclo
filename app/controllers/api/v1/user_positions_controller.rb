class Api::V1::UserPositionsController < Api::V1::BaseController
  def create
    @user_position = UserPosition.new(user_position_params)
    @user_position.user = current_user

    if @user_position.save
      render json: { user_position: @user_position }, status: :created # What would i need to render in this case as it's not really front-end stuff
    else
      render_error
    end
  end

  private

  def user_position_params
    params.require(:user_position).permit(:lat, :long) #Do i really need to permit the user_id if I'm assopciating it in the create method?
  end

  def render_error #I've followed the same syntax for errors as in the lecture slides.
    render json: { errors: @user_position.errors.full_messages },
    status: :unprocessable_entity
  end
end
