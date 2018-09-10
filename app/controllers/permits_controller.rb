class PermitsController < ApplicationController

  def index
    @models = Permit.published.page index_params[:page]

    @schema = {page: 'CollectionPage',
               main: 'DataCatalog'}
    @title = t 'permit.index.title'
    @keywords = t 'permit.index.keywords', default: ''
    @description = t 'permit.index.description', default: ''
    @header = t 'permit.index.header'

    if index_params[:page]
      @title = "#{@title} # #{index_params[:page]}"
      @description = "#{@description} # #{index_params[:page]}"
    end
  end

  def show
  end

  private

  def index_params
    params.permit(:page)
  end


  def show_params
    params.permit(:id)
  end

end
