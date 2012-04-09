class TeachersController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
     @search = Teacher.search(params[:search])
     @teachers = @search.order(sort_column + " " + sort_direction).page(params[:page]).per(5)
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end
  
  def create
    @teacher = Teacher.new(params[:teacher])
    if @teacher.save
      redirect_to teachers_path
      flash[:notice] = "teacher has been add"
    else
      render 'new'
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end
  
  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(params[:teacher])
      redirect_to teachers_path
      flash[:notice] = "teacher has been updates"
    else
      render 'edit'
    end
  end
  
  private

    def sort_column
      Teacher.column_names.include?(params[:sort]) ? params[:sort] : "nip"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
