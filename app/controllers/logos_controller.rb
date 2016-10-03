class LogosController < ApplicationController
	before_action :find_logo, only: [:show, :edit, :update, :destroy]

	def index
		if params[:category].blank?
			@logos = Logo.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@logos = Logo.where(category_id: @category_id).order("created_at DESC")
		end

	end

	def show
	end

	def new
		@logo = Logo.new
	end

	def create
		@logo = Logo.new(logo_params)

		if @logo.save
			redirect_to @logo
		else
			render 'New'
		end

	end

	def edit
	end

	def update
		if @logo.update(logo_params)
			redirect_to @logo
		else
			render 'edit'
		end
	end

	def destroy
		@logo.destroy
		redirect_to logos_path
	end

	private

	def logo_params
		params.require(:logo).permit(:title, :description, :category_id)
	end

	def find_logo
		@logo = Logo.find(params[:id])
	end
end
