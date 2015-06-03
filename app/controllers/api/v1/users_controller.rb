class Api::V1::UsersController < Api::V1::BaseController
  def show
    @user = User.find(params[:id])

    # render(json: Api::V1::UserSerializer.new(user).to_json)
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(update_params)
  end

  private

  def update_params
    params.require(:user).permit(:email)
  end
end
