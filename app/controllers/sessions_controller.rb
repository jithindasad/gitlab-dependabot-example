# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to repositories_path
  end

  def destroy
    Repository.delete_all
    session[:user_id] = nil
    redirect_to root_path
  end
end
