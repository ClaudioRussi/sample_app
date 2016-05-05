class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user=User.new(user_params)
    if @user.save
      flash[:success]="Welcome to the sample app"
      redirect_to @user
    else
      render 'new'
    end

  end

  private #Definimos los strong-params para poder elegir que parametros recibe del form, asi no pueden insertar paremtros no existentes.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
