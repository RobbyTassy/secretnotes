class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    # definition of ".try": asks object if it can authenticate if so return or not return nil

    return render action: 'new' unless @user

    #logged in, horray
    session[:user_id] = @user.id
    redirector_to notes_path
  end

end
