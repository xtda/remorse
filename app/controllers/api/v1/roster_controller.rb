# app/controllers/api/v1/users_controller.rb
module Api::V1
  class RosterController < ApiController
    include ApplicationController::WowHelper
    def index
      @members = []
      @ranged_count = 0
      @tank_count = 0
      @healer_count = 0
      @roster = Roster.where(hidden: false).order('role', 'player_name')
      @roster.each do |member|
        roster = {
          name: member.player_name,
          class: player_class_is(member.player_class),
          spec:  member.player_spec,
          role: member.role
        }
        @members.push roster
        @ranged_count += 1 if member.ranged? member
        @tank_count += 1 if member.tank?
        @healer_count += 1 if member.healer?
      end
      response = [
        members: @members,
        stats: {
          tanks: @tank_count,
          healers: @healer_count,
          ranged: @ranged_count,
          melee: ((@members.count - @tank_count) - @healer_count) - @ranged_count,
          total: @members.count
        }
      ]
      render json: response
    end
  end
end
