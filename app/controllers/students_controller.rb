class StudentsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @search = Student.search(params[:search])
    @students = @search.order(sort_column + " " + sort_direction).page(params[:page]).per(5)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to students_path
      flash[:notice] = "student has been add"
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      redirect_to students_path
      flash[:notice] = "student has been edit"
    else
      render 'edit'
    end
  end
  
  private

    def sort_column
      Student.column_names.include?(params[:sort]) ? params[:sort] : "email"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
end
