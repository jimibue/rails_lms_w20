class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    # bad not santizing params but should work
    # or do error checking
    @course = Course.create(name: params[:course][:name])
    redirect_to @course
  end
end
