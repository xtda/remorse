class Roster < ApplicationRecord
  include ApplicationController::WowHelper
  enum role: %i[tank healer dps]

  def self.get_role(role)
    return 0 if role == 'TANK'
    return 1 if role == 'HEALING'
    return 2 if role == 'DPS'
  end

  def self.create_member(member)
    Roster.where(player_name: member['character']['name']).first_or_create do |new_member|
      new_member.player_name = member['character']['name']
      new_member.player_class = member['character']['class']
      new_member.thumbnail_link = member['character']['thumbnail']
      member['character']['spec'] ? new_member.player_spec = member['character']['spec']['name'] : new_member.player_spec = ""
      member['character']['spec'] ? new_member.role = get_role(member['character']['spec']['role'].to_s) : new_member.role = 0
      new_member.hidden = false
    end
  end
end
