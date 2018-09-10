class StaticsController < ApplicationController

  def home
    @title = t 'static.home.title'
    @label = ''
    @keywords = t 'static.home.keywords', default: ''
    @description = t 'static.home.description', default: ''
    @header = t 'static.home.header'
  end

end
