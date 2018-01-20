class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end
  def create
    respond_to do |format|
      user = User.find_by(login: params[:session][:login])
      if user && user.authenticate(params[:session][:password])
        format.html {
          log_in user
          redirect_to user
        }
        format.json {
          user.password = params[:session][:password]
          user.regenerate_token
          render json: { token: user.token }
        }
      else
        format.html {
          render 'new'
        }
        format.json {
          render json: { message: 'Niepoprawne dane' }
        }
      end
    end
  end
  def destroy
    respond_to do | format |
        format.html do
          log_out
          redirect_to root_url
        end
        format.json do
          require_token
          if current_user
            current_user.invalidate_token
            head :ok
          end
        end
      end
  end
end
