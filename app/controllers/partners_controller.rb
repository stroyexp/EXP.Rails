class PartnersController < ApplicationController

  def index
    @models = Customer.published.page index_params[:page]

    @schema = {page: 'CollectionPage',
               main: 'DataCatalog'}
    @title = t 'customer.index.title'
    @keywords = t 'customer.index.keywords', default: ''
    @description = t 'customer.index.description', default: ''
    @header = t 'customer.index.header'

    if index_params[:page]
      @title = "#{@title} # #{index_params[:page]}"
      @description = "#{@description} # #{index_params[:page]}"
    end
  end


  def show
    @model = Customer.published.find show_params[:id]

    @schema = {page: 'ItemPage',
               main: 'Dataset'}
    @title = @model.title.blank? ? @model.name : @model.title
    @keywords = @model.keywords
    @description = @model.description
    @header = @model.name
  end

  private

  def index_params
    params.permit(:page)
  end


  def show_params
    params.permit(:id)
  end

end
