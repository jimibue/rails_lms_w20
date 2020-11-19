class TacosController < ApplicationController
  def index
    @users = User.all
    @courses = Course.all
    @enrollments = Enrollment.all
    User.create(first_name: "taco", last_name: "hello")
  end
end
