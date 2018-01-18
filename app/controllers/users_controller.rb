class UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def login
    user = User.find_by_email(params[:email])

    if user
      render json: { email: user.email, user_id: user.id },
      status: :ok
    else
      render json: {errors: "Username does not exist in our records"},
      status: :bad_request
    end
  end

  def signup
    user = User.new(user_params)

    if User.find_by_email(params[:email])
      render json: {errors: "email already exists in our records"},
      status: :bad_request
    else
      user.email = user.email.downcase
      if user.save
        render json: { name: user.name, email: user.email, password: user.password, user_id: user.id }, status: :ok
      else
        render json: { errors: user.errors.messages },
        status: :bad_request
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end

  # def create
  #need to create conditional -- search for user, if exists, return user id
  # if doesn't exit, create new user and give visual feedback
  # user = User.find_by(params[:email])

  #    @merchant = Merchant.find_by(id: expected_merchant_id)


  # if user.save
  #   render json: { name: user.name, email: user.email, password: user.password, user_id: user.id }, status: :ok
  # else
  #   render json: { errors: user.errors.messages },
  #     status: :bad_request
  # end



  # @user = User.new(user_params)
  #       if @user.save
  #         render text: @user.access_token, status: 201
  #       else
  #         render json: @user.errors, status: 422
  #       end
  # end

  #
  # def index
  #   users = User.all
  #   render json: users, status: :ok
  # end
