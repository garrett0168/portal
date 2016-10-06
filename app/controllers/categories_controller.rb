class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def show
    respond_with(@category)
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end
end
