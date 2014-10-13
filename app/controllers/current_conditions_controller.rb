class CurrentConditionsController < ApplicationController
  def index
    if params[:current_condition]
      @current_conditions = CurrentCondition.new(params['current_condition'])
    else
      @current_conditions = CurrentCondition.new
    end
  end
end
