class RosterSerializer < ActiveModel::Serializer
  include ApplicationController::WowHelper

  attributes :player_name, :player_class, :player_spec, :role
  def player_class
    player_class_is(object.player_class)
  end

  def player_spec
    object.player_spec
  end
end