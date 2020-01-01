class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  # Get /users/:id
  def show
    render json: { user: @user, serializer: UserSerializer}, status: 200
  end

  private 
    
    def set_user
      @user = User.find(params[:id])
      render json: { error: "User Not Found"} unless @user and return      
    end
end