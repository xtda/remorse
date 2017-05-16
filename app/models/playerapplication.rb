class Playerapplication < ApplicationRecord
  include DiscordHelper

  validates :player_name, presence: true
  validates :player_class, inclusion: { in: %w(Druid Hunter Mage Paladin Priest Rogue Shaman Warlock Warrior DeathKnight Monk DemonHunter) }
  validates :player_battlenettag, presence: true
  validates :link_warcraftlogs, presence: true
  validates :link_wowprogress, presence: true

  before_create :generate_viewkey
  after_save :send_to_discord

  private

  def generate_viewkey
    self.viewkey = SecureRandom.urlsafe_base64
  end

  def send_to_discord
    send_to_recruitment_channel("**New application submitted**\n" \
                                "**Name:** #{player_name}\n" \
                                "**Class:** #{player_class}\n" \
                                "**Spec:** #{player_mainspec}\n\n" \
                                "Click here to view: http://remorse.addictionsoftware.com/application/#{id}?viewkey=#{viewkey}")
  end

end
