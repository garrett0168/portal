class FlyersController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		if params[:category].blank?
			@flyers = Flyer.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@flyers = Flyer.where(category_id: @category_id).order("created_at DESC")
		end
	end

	def show

	end

	def new
		@flyer = current_user.flyers.build
	end

	def create
		@flyer = current_user.flyers.build(post_params) 
		if  @flyer.save
			redirect_to flyers_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @flyer.update(post_params)
			redirect_to flyers_path
		else
			render 'edit'
		end
	end

	def destroy
		@flyer.destroy
		redirect_to flyers_path
	end

	private


	def post_params
		params.require(:flyer).permit(:title, :description, :document, :category_id)
	end

	def find_post
		@flyer = Flyer.find(params[:id])
	end
end
