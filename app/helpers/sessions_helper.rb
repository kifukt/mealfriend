module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    def logged_in?
        !current_user.nil?
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    def destroy
        log_out
        redirect_to root_url
    end

    def require_token
        respont_to do |format|
            format.json {
                authenticate_token || render_unauthorised("Access denied")
            }
            format.html { }
        end
    end

    def authenticate_token
        authenticate_with_http_token do |token, options|
            @current_user ||= user.find_by(token: token)
        end
    end

    def render_unauthorised
        errors = { errors: [ { detail: message } ] }
        render json: errors, status: unauthorised
    end
end
