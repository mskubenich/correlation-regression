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
    if params[:spadk] && params[:spadk] != 'all'
      main_query[params[:spadk]] = true
      control_query[params[:spadk]] = true if params[:spadk] == 'spadkovist'
    end
    if params[:risk] && params[:risk] != 'all'
      main_query[params[:risk]] = true
    end
    if params[:skt_level] && params[:skt_level] != 'all'
      main_query[:skt_level] = params[:skt_level]
    end

    @main_children = Child.where(main_query.merge({group: 'main'})).order('id asc')
    @control_children = Child.where(control_query.merge({group: 'control'})).order('id asc')

    if params[:cohort] && params[:cohort].to_i > 0
      @main_selection = Selection.new @main_children.map(&:age), params[:cohort]
      @control_selection = Selection.new @control_children.map(&:age), params[:cohort]
    end
  end

  def index_fixed

    main_query = {}
    control_query = {}
    if params[:sex] && params[:sex] != 'all'
      main_query[:sex] = params[:sex]
      control_query[:sex] = params[:sex]
    end
    if params[:rozlad_skt] && params[:rozlad_skt] != 'all'
      main_query[params[:rozlad_skt]] = true
    end
    if params[:spadk] && params[:spadk] != 'all'
      main_query[params[:spadk]] = true
      control_query[params[:spadk]] = true if params[:spadk] == 'spadkovist'
    end
    if params[:risk] && params[:risk] != 'all'
      main_query[params[:risk]] = true
    end
    if params[:skt_level] && params[:skt_level] != 'all'
      main_query[:skt_level] = params[:skt_level]
    end

    @main_children = Child.where(main_query.merge({group: 'main_fixed'})).order('id asc')
    @control_children = Child.where(control_query.merge({group: 'control_fixed'})).order('id asc')

    if params[:cohort] && params[:cohort].to_i > 0
      @main_selection = Selection.new @main_children.map(&:age), params[:cohort]
      @control_selection = Selection.new @control_children.map(&:age), params[:cohort]
    end
  end

  def group

    main_query = {}
    control_query = {}
    if params[:sex] && params[:sex] != 'all'
      main_query[:sex] = params[:sex]
      control_query[:sex] = params[:sex]
    end
    if params[:rozlad_skt] && params[:rozlad_skt] != 'all'
      main_query[params[:rozlad_skt]] = true
    end
    if params[:spadk] && params[:spadk] != 'all'
      main_query[params[:spadk]] = true
      control_query[params[:spadk]] = true if params[:spadk] == 'spadkovist'
    end
    if params[:risk] && params[:risk] != 'all'
      main_query[params[:risk]] = true
    end
    if params[:skt_level] && params[:skt_level] != 'all'
      main_query[:skt_level] = params[:skt_level]
    end


    @children = Child.where(main_query.merge({group: '3'})).order('id asc')
    if params[:cohort] && params[:cohort].to_i > 0
      @selection = Selection.new @children.map(&:age), params[:cohort]
    end
  end

  def group_fixed
    main_query = {}
    control_query = {}
    if params[:sex] && params[:sex] != 'all'
      main_query[:sex] = params[:sex]
      control_query[:sex] = params[:sex]
    end
    if params[:rozlad_skt] && params[:rozlad_skt] != 'all'
      main_query[params[:rozlad_skt]] = true
    end
    if params[:spadk] && params[:spadk] != 'all'
      main_query[params[:spadk]] = true
      control_query[params[:spadk]] = true if params[:spadk] == 'spadkovist'
    end
    if params[:risk] && params[:risk] != 'all'
      main_query[params[:risk]] = true
    end
    if params[:skt_level] && params[:skt_level] != 'all'
      main_query[:skt_level] = params[:skt_level]
    end

    @children = Child.where(main_query.merge({group: '3_fixed'})).order('id asc')
    if params[:cohort] && params[:cohort].to_i > 0
      @selection = Selection.new @children.map(&:age), params[:cohort]
    end
  end
end
