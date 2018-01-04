class EntriesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    entries = Entry.all
    render json: entries, status: :ok
  end

  def show
    # render(
    # status: :ok,
    # json:
    # )
  end

  def create
    entry = Entry.new(entry_params)

    if entry.save
      render json: { text: entry.text }, status: :ok
    else
      render json: { errors: entry.errors.messages },
        status: :bad_request
    end

    # entry.save!
    # render json: entry, status: :ok
  end

  def update
  end

  def destroy
  end


  private
    def entry_params
      params.require(:entry).permit(:text)
    end

end
