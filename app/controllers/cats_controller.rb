class CatsController < ApplicationController

  before_action :redirect_to_cats_if_not_logged_in, except: [:index, :show]
  before_action :make_sure_user_is_not_creepily_editing_someone_elses_cat, only: [:edit, :update]
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def make_sure_user_is_not_creepily_editing_someone_elses_cat
    # fail
    @cat = current_user.cats.where(id: params[:id]).first
    redirect_to cat_url(params[:id]) if @cat.nil?
  end

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
