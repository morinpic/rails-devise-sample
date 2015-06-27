class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admins_path, notice: '新規管理者を作成しました'
    else
      render :new
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to admins_path, notice: '管理者情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    if @admin.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password)
  end
end
