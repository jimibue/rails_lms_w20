class EnrollmentsController < ApplicationController
  def index
    # less generic here our code is going away from rails convention
    # to meet UX requirments
    @course = Course.find(params[:course_id])
    @teachers = @course.enrollments.where(role: "teacher")
    @tas = @course.enrollments.where(role: "ta")
    @students = @course.enrollments.where(role: "student")
  end

  def new
    @course = Course.find(params[:course_id])
    # grab a list of users who are not enrolled in the course
    @users = User.all - @course.users
    @enrollment = Enrollment.new
  end

  def create
    @course = Course.find(params[:course_id])
    @enrollment = @course.enrollments.new(enrollment_params)
    if @enrollment.save
      redirect_to course_enrollments_path(@course)
    else
      render :new
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @course.enrollments.find(params[:id]).destroy
    redirect_to course_enrollments_path(@course)
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:user_id, :role)
  end
end
