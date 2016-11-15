class SessionsController < ApplicationController

  def index
    @name = session[:name]
  end

  def set_session
    session[:name] = "Diana"
  end

  def another
    @name = session[:name]
  end

  def show
    
  end

  def new
    @user = User.new
  end

  def create
  input_username = params[:user][:username]

    if User.exists?(username: input_username)
      @user = User.find_by(username: input_username)

      if @user.password == params[:user][:password]
        puts "You're signed in!"
        session[:user_id] = @user.id
        redirect_to root_path
      else
        puts "Wrong password!"
        redirect_to new_session_path
      end

    else
      puts "That user doesn't exist!"
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    puts "You're signed out!"
    redirect_to :root
  end

end
