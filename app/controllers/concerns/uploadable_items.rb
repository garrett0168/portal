module UploadableItems
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!, except: [:show]
    before_action :find_item, only: [:show, :edit, :update, :destroy]
  end

  def index
    model = get_model
    if params[:category].blank?
      instance_variable_set("@#{instance_name}", model.all.order("created_at DESC"))
    else
      @category = Category.find_by(name: params[:category])
      if @category.root?
        # Parent category
        subcategory_ids = @category.children.pluck(:id)
        instance_variable_set("@#{instance_name}", model.joins("LEFT JOIN uploadable_items_subcategories ON uploadable_items_subcategories.uploadable_item_id = uploadable_items.id").where("uploadable_items.category_id = ? or uploadable_items_subcategories.category_id IN (?)", @category.id, subcategory_ids).order("created_at DESC"))
      else
        # Subcategory
        instance_variable_set("@#{instance_name}", model.joins(:uploadable_items_subcategories).where("uploadable_items_subcategories.category_id = ?", @category.id).order("created_at DESC"))
      end
    end
  end

  def recent
    instance_variable_set("@#{instance_name}", Flyer.where("created_at > ?", Time.current - 20.days))
    render :index
  end

  def show

  end

  def new
    instance_variable_set("@#{instance_name}", current_user.uploadable_items.build(type: get_model.to_s))
  end

  def create
    instance_variable_set("@#{instance_name}", current_user.uploadable_items.build(post_params))
    if instance_variable_get("@#{instance_name}").save
      redirect_to redirect_index_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if instance_variable_get("@#{instance_name}").update(post_params)
      redirect_to redirect_index_path
    else
      render 'edit'
    end
  end

  def destroy
    instance_variable_get("@#{instance_name}").destroy
    redirect_to redirect_index_path
  end

  protected

  def get_model
    controller_path.classify.constantize
  end

  def instance_name
    params[:action].to_sym == :index ? controller_name.pluralize : controller_name.singularize
  end

  def redirect_index_path
    send("#{controller_name.pluralize}_path")
  end

  def find_item
    instance_variable_set("@#{instance_name}", get_model.find(params[:id]))
  end

  def post_params
    params[instance_name][:type] = get_model.to_s
    params.require(instance_name).permit(:type, :title, :description, :document, :category_id, uploadable_items_subcategories_attributes: [:id, :category_id, :_destroy])
  end
end