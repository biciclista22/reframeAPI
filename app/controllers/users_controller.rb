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
    #need to create conditional -- search for user, if exists, return user id
    # if doesn't exit, create new user and give visual feedback
    user = User.new(user_params)

    if user.save
      render json: { name: user.name, email: user.email, password: user.password, user_id: user.id }, status: :ok
    else
      render json: { errors: user.errors.messages },
        status: :bad_request
    end



    # @user = User.new(user_params)
    #       if @user.save
    #         render text: @user.access_token, status: 201
    #       else
    #         render json: @user.errors, status: 422
    #       end
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
