class ObjectsController < ApplicationController

  def index
    if index_params[:area]
      area = index_params[:area].to_i
      return redirect_to objects_url(important: index_params[:important]), status: 301 if area == 0
      area = Area.active.find area
    end
    @models = (area.nil? ? Target : area.targets).published.weight.page params[:page]

    @schema = {page: 'CollectionPage',
               main: 'DataCatalog'}
    @title = t 'target.index.title'
    @keywords = t 'target.index.keywords', default: ''
    @description = t 'target.index.description', default: ''
    @header = t 'target.index.header'

    unless area.nil?
      @title = "#{@title} [#{area.name}]"
      @description = "#{@description} [#{area.name}]"
    end

    if index_params[:page]
      @title = "#{@title} # #{index_params[:page]}"
      @description = "#{@description} # #{index_params[:page]}"
    end
  end


  def show
    @model = Target.published.find show_params[:id]

    @schema = {page: 'ItemPage',
               main: 'Dataset'}
    @title = @model.title.blank? ? @model.name : @model.title
    @keywords = @model.keywords
    @description = @model.description
    @header = @model.name
  end

  private

  def index_params
    params.permit(:area, :important, :page)
  end


  def show_params
    params.permit(:id)
  end

end
