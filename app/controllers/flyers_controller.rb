class FlyersController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@flyers = Flyer.all.order("created_at DESC")
	end

	def show

	end

	def new
		@flyer = current_user.flyers.build
	end

	def create
		@flyer = current_user.flyers.build(post_params) 
		if  @flyer.save
			redirect_to @flyer
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @flyer.update(post_params)
			redirect_to @flyer
		else
			render 'edit'
		end
	end

	def destroy
		@flyer.destroy
		redirect_to flyers_path
	end

	private

	def find_post
		@flyer = Flyer.find(params[:id])
	end

	def post_params
		params.require(:flyer).permit(:title, :description)
	end

end
