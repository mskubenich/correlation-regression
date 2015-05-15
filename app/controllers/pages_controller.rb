class PagesController < ApplicationController
  def index
    @main_children = Child.where(group: 'main').order('id asc')
    @control_children = Child.where(group: 'control').order('id asc')
  end

  def show
  end
end
