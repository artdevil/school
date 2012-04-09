class SubjectsController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction
  def show
    @subject = Subject.find(params[:id])
  end

  def index
    @search = Subject.search(params[:search])
    @subjects = @search.order(sort_column + " " + sort_direction).page(params[:page]).per(5)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params[:subject])
    if @subject.save
      redirect_to subjects_path
      flash[:notice] = "subject has been add"
    else
      render 'new'
    end
  end
  
  def edit
    @subject = Subject.find(params[:id])
  end
  
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      redirect_to subjects_path
      flash[:notice] = "subject has been updates"
    else
      render 'edit'
    end
  end
  
  def destroy
    @subject = Subject.find(params[:id])
    if @subject.destroy
      redirect_to subjects_path
      flash[:notice] = "subject has been Delete"
    end
  end
  
  private

    def sort_column
      Teacher.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
