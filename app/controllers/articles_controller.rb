class ArticlesController < ApplicationController

  def index
    @models = Article.published.page index_params[:page]

    @schema = {page: 'CollectionPage',
               main: 'DataCatalog'}
    @title = t 'article.index.title'
    @keywords = t 'article.index.keywords', default: ''
    @description = t 'article.index.description', default: ''
    @header = t 'article.index.header'

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
