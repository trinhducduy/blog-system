class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Entry.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    @entry = Entry.new
  end

  def show
    @comments = @entry.comments.paginate(page: params[:page], per_page: 5)
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    if @entry.save
      flash[:success] = "Post was successfully created!"
      redirect_to @entry
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      flash[:success] = "Entry was successfully updated!"
      redirect_to @entry
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    flash[:success] = "Entry was successfully deleted!"
  end

  protected

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :published_date, :body)
  end
end
