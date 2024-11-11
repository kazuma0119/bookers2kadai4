class UsersController < ApplicationController
  def index
    @user=User.new
    @users=User.all
  end
  def show
    @user=User.find(params[:id])
    @books = @user.books
  end
  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
         flash[:notice] = "User was successfully updated."
         redirect_to user_path(@user.id)
    else
        @users=User.all
        render :edit
    end
  end
  def edit
    @user=User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:name,:image,:introduction)
  end
end
