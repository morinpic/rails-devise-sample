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

  private

  def admin_params
    params.require(:admin).permit(:email, :password)
  end
end
