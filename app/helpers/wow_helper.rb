module WowHelper

  API_KEY = ENV['BNET_API_KEY']

  def player_information(name, realm)
    armory = armory_information(name, realm)
    player = [
      wow: {
        name: armory['name'],
        class: player_class(armory['class']),
        spec: player_spec(armory['talents']),
        gear: {
          equip_ilvl: armory['items']['averageItemLevelEquipped'],
          max_ilvl: armory['items']['averageItemLevel'],
          artifact: weapon_info(armory['items'], 'resto')
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

  def player_class(value)
    classes = ['Warrior', 'Paladin', 'Hunter', 'Rogue', 'Priest', \
               'Death Knight', 'Shaman', 'Mage', 'Warlock', \
               'Monk', 'Druid', 'Demon Hunter'].freeze
    classes.at(value - 1)
  end

  def player_spec(value)
    value.each do |key|
      if key['selected'] == true
        return key['spec']['name']
      end
    end
  end

  def weapon_info(items, player_spec)
    player_spec == 'protection' ? weapon_info = items['offHand']['artifactTraits'] : weapon_info = items['mainHand']['artifactTraits']
    weapon_info.map { |s| s['rank'] }.reduce(0, :+) - 3
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