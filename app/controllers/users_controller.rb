class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    # render(
    # status: :ok,
    # json:
    # )
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: { name: user.name, email: user.email, password: user.password }, status: :ok
    else
      render json: { errors: user.errors.messages },
        status: :bad_request
    end

  end

  def update
  end

  def destroy
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
