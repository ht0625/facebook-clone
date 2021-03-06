class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def authenticate_user
    if current_user == nil
      redirect_to new_session_path, notice:'ログインが必要です'
    end
  end
  def ensure_correct_user
    if current_user.id !=  @feed.user_id
      redirect_to feeds_path,notice: 'アクセスできません'
    end
  end
end
