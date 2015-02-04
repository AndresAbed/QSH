class ListsController < ApplicationController
  def create
    @list = List.new :name => current_user.username
    if @list.save
      redirect_to :back
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
