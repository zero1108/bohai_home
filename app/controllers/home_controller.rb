class HomeController < ApplicationController

  def index
    @courses = Course.all.order(position: :asc)
    @teachers = Teacher.all.order(id: :asc)
    @contact = Contact.new
  end

  def news
  end

  def teachers
  end

  def courses
  end
end