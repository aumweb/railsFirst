class CategoryController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]


	def index
    	
    	@category = Category.paginate :page => params[:page], :per_page => 3
    	render 'categories/index'
  	end

  	def new
      @category = Category.new
    	render 'categories/new'
  	end

  	def create
     @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "category was created successfully."
      redirect_to category_path
    else
      render 'new'
    end
  end

  	def edit
    	render 'categories/edit'
  	end

      def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_path, notice: 'category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  	def destroy
      @category.destroy
      respond_to do |format|
        format.html { redirect_to category_path, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:title,:description)
    end
end