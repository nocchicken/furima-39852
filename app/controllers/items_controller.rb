class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  # def edit
  #   @item = Item.find(params[:id])
  # end

  # def update
  #   item = Item.find(params[:id])
  #   item.update(tweet_params)
  #   redirect_to root_path
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_day_id,:prefecture_id, :brand_id, :price).merge(user_id: current_user.id)
  end
end
