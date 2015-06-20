class FutureConditionsController < ApplicationController
  def index
    if params[:current_condition]
      @future_conditions = FutureCondition.new(params["current_condition"])
    else
      @future_conditions = FutureCondition.new
    end
  end
end
