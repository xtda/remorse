module WowHelper
  API_KEY = ENV['BNET_API_KEY']

  def player_information(name, realm)
    armory = armory_information(name, realm)
    player = [
      wow: {
        name: armory['name'],
        class: player_class_is(armory['class']),
        spec: player_spec_is(armory['talents']),
        gear: {
          equip_ilvl: armory['items']['averageItemLevelEquipped'],
          max_ilvl: armory['items']['averageItemLevel'],
          artifact: weapon_info(armory['items'], player_class_is(armory['talents']))
        },
        raid_progression: raid_progression(armory['progression'])
      },
      warcraftlogs: {
        link: "https://www.warcraftlogs.com/character/us/#{realm}/#{name}"
      },
      wowprogress: {
        link: "http://www.wowprogress.com/character/us/#{realm}/#{name}"
      }
    ]

    player.to_json
  end

  def armory_information(name, realm)
    uri = URI.encode("https://us.api.battle.net/wow/character/#{realm}/#{name}?fields=items,progression,guild,achievements,talents&apikey=#{API_KEY}")
    request = RestClient.get(uri)
    JSON.parse(request)
  end

  def guildarmory_information(name, realm)
    uri = URI.encode("https://us.api.battle.net/wow/guild/#{realm}/#{name}?fields=members&locale=en_US&apikey=xatgfhyag79xfmqqsyak7nds39mxfmrw")
    request = RestClient.get(uri)
    JSON.parse(request)
  end

  def guild_roster(realm, name, rank)
    guild = guildarmory_information(name, realm)
    guild['members'].each do |member|
      next unless member['rank'] <= rank.to_i
      next if member['rank'].to_i == 2 || member['rank'].to_i == 4
      Roster.create_member(member)
    end
  end

  def player_class_is(value)
    classes = ['Warrior', 'Paladin', 'Hunter', 'Rogue', 'Priest', \
               'Death Knight', 'Shaman', 'Mage', 'Warlock', \
               'Monk', 'Druid', 'Demon Hunter'].freeze
    classes.at(value - 1)
  end

  def player_spec_is(value)
    value.each do |key|
      return key['spec']['name'] if key['selected'] == true
    end
  end

  def weapon_info(items, player_spec)
    player_spec == 'Protection' ? weapon_info = items['offHand']['artifactTraits'] : weapon_info = items['mainHand']['artifactTraits']
    weapon_info.map { |s| s['rank'] }.reduce(0, :+) - 3
  end

  def ranged?(player)
    return true if player.player_class == 5 || player.player_class == 8 || \
                   player.player_class == 9 || player.player_spec == 'Balance' || \
                   player_spec == 'Survival' || player_spec == 'Elemental'
    false
  end

  def raid_progression(armory_progression)
    progression = []

    valid_raids = [
      'The Emerald Nightmare',
      'Trial of Valor',
      'The Nighthold'
    ].freeze

    armory_progression['raids'].each do |raid|
      valid_raids.each do |raids|
        if raid['name'] == raids
          raid['bosses'].each do |boss|
            if boss['mythicKills'] >= 1
              @mythic_progress += 1
            end
            if boss['heroicKills'] >= 1
              @heroic_progress += 1
            end
            if boss['normalKills'] >= 1
                @normal_progress += 1
            end
          end
          #progression += "#{raid['name']}: #{@normal_progress} / #{raid['bosses'].length} (N) #{@heroic_progress} / #{raid['bosses'].length} (H) #{@mythic_progress} / #{raid['bosses'].length} (M) "
          new_progression = {
              name: raid['name'],
              progression: {
                normal: "#{@normal_progress} / #{raid['bosses'].length}",
                heroic: "#{@heroic_progress} / #{raid['bosses'].length}",
                mythic: "#{@mythic_progress} / #{raid['bosses'].length}"
              }
          }
          progression.push(new_progression)
        end
      end
      @normal_progress = 0
      @heroic_progress = 0
      @mythic_progress = 0
    end
    progression
  end
end