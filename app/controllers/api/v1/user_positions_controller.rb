class Api::V1::UserPositionsController < Api::V1::BaseController
  def create
    @user_position = UserPosition.new(user_position_params)
    @user_position.user = current_user

    if @user_position.save
      render json: { user_position: @user_position }, status: :created
    else
      render_error
    end
  end

  private

  def user_position_params
    params.require(:user_position).permit(:lat, :long)
  end

  def render_error
    render json: { errors: @user_position.errors.full_messages },
    status: :unprocessable_entity
  end
end
