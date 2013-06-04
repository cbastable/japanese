class CollectionsController < ApplicationController
  def index
  	@collections = Collection.all
  end

  def show
  	@collection = Collection.find_by_id(params[:id])
  end
end
