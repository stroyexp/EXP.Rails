class PublishesController < ApplicationController

  def index
    @models = Publish.published.page index_params[:page]

    @schema = {page: 'CollectionPage',
               main: 'DataCatalog'}
    @title = t 'publish.index.title'
    @keywords = t 'publish.index.keywords', default: ''
    @description = t 'publish.index.description', default: ''
    @header = t 'publish.index.header'

    if index_params[:page]
      @title = "#{@title} # #{index_params[:page]}"
      @description = "#{@description} # #{index_params[:page]}"
    end
  end


  def show
    @model = Publish.published.find show_params[:id]

    @schema = {page: 'ItemPage',
               main: 'Dataset'}
    @title = @model.title.blank? ? @model.header : @model.title
    @keywords = @model.keywords
    @description = @model.description
    @header = @model.header
  end


  private


  def index_params
    params.permit(:page)
  end


  def show_params
    params.permit(:id)
  end

end
