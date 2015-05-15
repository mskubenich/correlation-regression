class PagesController < ApplicationController
  def index

    main_query = {}
    control_query = {}
    if params[:sex] && params[:sex] != 'all'
      main_query[:sex] = params[:sex]
      control_query[:sex] = params[:sex]
    end
    if params[:rozlad_skt] && params[:rozlad_skt] != 'all'
      main_query[params[:rozlad_skt]] = true
    end

    @main_children = Child.where(main_query.merge({group: 'main'})).order('id asc')
    @control_children = Child.where(control_query.merge({group: 'control'})).order('id asc')
  end

  def show
  end
end
