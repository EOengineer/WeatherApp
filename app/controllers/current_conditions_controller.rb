class CurrentConditionsController < ApplicationController
  def index
    if params[:current_condition]
      @current_conditions = CurrentCondition.new(params[:current_condition][:zip_code]).gather_all
    else
      @current_conditions = CurrentCondition.new.gather_all
    end
  end
end
