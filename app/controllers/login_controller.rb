class LoginController < ApplicationController
  def new
  end

  def create
    company = Company.find_by_email(params.require[:company][:email])

    if company && company.valid_password?(params.require[:company][:password])
      session[:company_id] = company.id
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid e-mail or password'
      render action: 'new'
    end
  end
end
