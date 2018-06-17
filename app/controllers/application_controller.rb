class ApplicationController < ActionController::Base
  
  private

  def current_company
    @current_company ||= if session[:company_id]
      Company.find_by_id(session[:company_id])
    end
  end
  helper_method :current_company
end
