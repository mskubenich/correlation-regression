class PagesController < ApplicationController
  def index
    @children = Child.all
  end

  def show
  end
end
