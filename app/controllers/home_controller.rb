class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show
    if params['student'] != nil
      studentWage = params['student'].to_f
    else
      studentWage = 12.90
    end
    if params['actual'] != nil
      actualWage = params['actual'].to_f
    else
      actualWage = 13.50
    end
    if params['hours'] != nil
      hours = params['hours'].to_i
    else
      hours = 0
    end
    studentWage = 12.90 if studentWage == 0
    actualWage = 13.50 if actualWage == 0
    extraHours = ((hours*actualWage - hours*studentWage) / studentWage)
    @roundedHours = (extraHours * 2.0).round / 2.0
  end
end
