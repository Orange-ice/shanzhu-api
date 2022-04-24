class Api::V1::ItemsController < ApplicationController
  def create
    item = Item.new amount: params[:amount]
    if item.save
      render json: { resource: item }, status: 201
    else
      render json: { errors: item.errors }, status: 422
    end
  end

  def index
    items = Item.page(params[:page])
    render json: {
      resources: items, pager: {
        current_page: params[:page],
        per_page: 5,
        total: Item.count
      }
    }, status: 200
  end
end
