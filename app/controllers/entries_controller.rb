class EntriesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    user = User.find(params[:user_id])
    entries = user.entries

    render json: entries, status: :ok
  end


  def create
    entry = Entry.new(entry_params)
    # entry.user = User.first

    if entry.save
      render json: { text: entry.text }, status: :ok
    else
      render json: { errors: entry.errors.messages },
        status: :bad_request
    end

  end





  def update
  end

  def destroy
  end


  private
    def entry_params
      params.require(:entry).permit(:text, :user_id)
    end

end
