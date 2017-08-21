class RosterController < ApplicationController
  include WowHelper
  before_action :authenticate_admin, only: [:new]
  def index
    @roster = Roster.where(hidden: false).order('role', 'player_name')
  end

  def new
    guild_roster('frostmourne', 'remorse', 5)
    redirect_to roster_path
  end

  private

  def authenticate_admin
    return redirect_to root_url unless logged_in?
    redirect_to root_url unless current_user.admin? || current_user.dev?
  end
end
