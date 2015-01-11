class ItemsController < ApplicationController
  respond_to :html, :js

  def create
    @list = List.find(params[:list_id])
    @items = @list.items

    @item = @list.items.build(item_params)
    @item.list = @list

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to @list
    else
      flash[:error] = "There was a problem and the item wasn't saved. Please try again."
      render :new
    end

  end

  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was marked complete."
    else
      flash[:error] = "Something went wrong and your item was not marked complete. Please try again."
    end

    respond_with(@item) do |format|
      format.html { redirect_to [@list] }
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
