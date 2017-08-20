require "administrate/field/base"
include ApplicationController::WowHelper
class PlayerclassField < Administrate::Field::Base
  def to_s
    data
  end

  def playerclass
    player_class_is data
  end
end
