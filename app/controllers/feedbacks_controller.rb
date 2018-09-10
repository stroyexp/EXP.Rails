class FeedbacksController < ApplicationController

  def index
    @models = Feedback.published.page index_params[:page]

    @schema = {page: 'CollectionPage',
               main: 'DataCatalog'}
    @title = t 'feedback.index.title'
    @keywords = t 'feedback.index.keywords', default: ''
    @description = t 'feedback.index.description', default: ''
    @header = t 'feedback.index.header'

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
