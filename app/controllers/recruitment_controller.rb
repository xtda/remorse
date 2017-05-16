class RecruitmentController < ApplicationController
  before_action :authenticate_admin

  def index
    @recruitment = Setting.find_by(name: 'recruitment')
  end

  def update
    @recruitment = Setting.find_by(name: 'recruitment')
    settings = params[:setting]
    @recruitment.setting = JSON.parse(settings['setting'])
    if @recruitment.save
      flash.now[:success] = 'Recruitment widget updated'
      render 'index'
    end
  end

  def authenticate_admin
    unless logged_in?
      return redirect_to root_url
    end
    redirect_to root_url unless current_user.admin? || current_user.dev?
  end

end
