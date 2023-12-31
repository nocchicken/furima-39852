class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :item_if, only: [:edit, :update, :destroy]


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
   
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
     else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
      redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :status_id, :shipping_day_id,:prefecture_id, :brand_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_if
    if current_user != @item.user || !@item.buyer.nil?
      redirect_to root_path
    end
  end
end
