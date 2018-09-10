class ActivitiesController < ApplicationController

  def show
    @model = Activity.published.find show_params[:id]

    @title = @model.title.blank? ? @model.header : @model.title
    @keywords = @model.keywords
    @description = @model.description
    @header = @model.header
  end

  private

  def show_params
    params.permit(:id)
  end

end
