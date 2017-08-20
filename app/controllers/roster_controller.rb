class RosterController < ApplicationController
  include WowHelper

  def index
    @roster = Roster.where(hidden: false).order('role', 'player_name')
  end

  def new
    guild_roster('frostmourne', 'remorse', 5)
    render plain: 'OK 200'
  end
end
