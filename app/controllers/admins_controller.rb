class AdminsController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
  def index
    @search = Admin.search(params[:search])
    @admins = @search.order(sort_column + " " + sort_direction).page(params[:page]).per(5)
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      redirect_to admins_path
      flash[:notice] = "Admin has been created"
    else
      render 'new'
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end
  
  private

    def sort_column
      Admin.column_names.include?(params[:sort]) ? params[:sort] : "email"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
