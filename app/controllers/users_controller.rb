# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update_img
    @user = User.find(params[:id])

    @user.image = params[:user][:image]
    if @user.save
      flash[:success] = 'Image uploaded'
    else
      flash[:danger] = 'Image uploaded failed'
    end
    redirect_back(fallback_location: root_path)
  end
end
