class PlayerapplicationController < ApplicationController
  before_action :authenticate_admin, only: [:index, :destroy]

  def new
    @REALM_LIST = ["Aegwynn", "Aerie Peak", "Agamaggan", "Aggramar", "Akama", "Alexstrasza", "Alleria", "Altar of Storms", "Alterac Mountains",
         "Aman'Thul", "Anasterian", "Andorhal", "Anetheron", "Antonidas", "Anub'arak", "Anvilmar", "Arathor", "Archimonde", "Area 52",
         "Argent Dawn", "Arthas", "Arygos", "Auchindoun", "Azgalor", "Azjol-Nerub", "Azralon", "Azshara", "Azuremyst", "Baelgun",
         "Balnazzar", "Barthilas", "Benedictus", "Beta Leveling Realm 01", "Beta Leveling Realm 03",  "Beta Max Level PvP",
         "Black Dragonflight", "Blackhand", "Blackrock", "Blackwater Raiders", "Blackwing Lair", "Bladefist", "Blade's Edge",
         "Bleeding Hollow",  "Blood Furnace", "Bloodhoof", "Bloodscalp", "Bonechewer", "Borean Tundra", "Boulderfist",
         "Bronzebeard", "Broxigar",  "Burning Blade", "Burning Legion", "Caelestrasz", "Cairne", "Cenarion Circle", "Cenarius",
         "Cho'gall", "Chromaggus", "Coilfang", "Crushridge", "Daggerspine", "Dalaran", "Dalvengyr", "Dark Iron", "Darkspear",
         "Darrowmere", "Dath'Remar", "Dawnbringer", "Deathwing", "Demon Soul", "Dentarg", "Destromath", "Dethecus", "Detheroc",
         "Doomhammer", "Draenor", "Dragonblight", "Dragonmaw", "Draka", "Drakkari", "Drak'Tharon", "Drak'thul", "Dreadmaul",
         "Drenden", "Dunemaul", "Durotan", "Duskwood", "Earthen Ring", "Echo Isles", "Eitrigg", "Eldre'Thalas", "Elune",
         "Emerald Dream", "Eonar", "Eredar", "Executus", "Exodar", "Farstriders", "Feathermoon", "Fenris", "Firetree",
         "Fizzcrank", "Frostmane", "Frostmourne", "Frostwolf", "Galakrond", "Gallywix", "Garithos", "Garona", "Garrosh",
         "Ghostlands", "Gilneas", "Gnomeregan", "Goldrinn", "Gorefiend", "Gorgonnash", "Greymane", "Grizzly Hills", "Gul'dan",
         "Gundrak", "Gurubashi", "Hakkar", "Haomarush", "Hellscream", "Hydraxis", "Hyjal", "Icecrown", "Illidan", "Jaedenar",
         "Jubei'Thos", "Kael'thas", "Kalaran", "Kalecgos", "Kargath", "Kel'Thuzad", "Khadgar", "Khaz Modan", "Khaz'goroth",
         "Kil'jaeden", "Kilrogg", "Kirin Tor", "Korgath", "Korialstrasz", "Kul Tiras", "Laughing Skull", "Lethon", "Lightbringer",
         "Lightninghoof", "Lightning's Blade", "Llane", "Lothar", "Lycanthoth", "Madoran", "Maelstrom", "Magtheridon", "Maiev",
         "Malfurion", "Mal'Ganis", "Malorne", "Malygos", "Mannoroth", "Medivh", "Misha", "Mok'Nathal", "Moon Guard", "Moonrunner",
         "Mug'thol", "Muradin", "Nagrand", "Nathrezim", "Nazgrel", "Nazjatar", "Nemesis", "Ner'zhul", "Nesingwary",
         "Nordrassil", "Norgannon", "Onyxia", "Perenolde", "Proudmoore", "Quel'dorei", "Quel'Thalas", "Ragnaros", "Ravencrest",
         "Ravenholdt", "Rexxar", "Rivendare", "Runetotem", "Sargeras", "Saurfang", "Scarlet Crusade", "Scilla", "Sen'jin", "Sentinels",
         "Shadow Council", "Shadowmoon", "Shadowsong", "Shandris", "Shattered Halls", "Shattered Hand", "Shu'halo", "Silver Hand",
         "Silvermoon", "Sisters of Elune", "Skullcrusher", "Skywall", "Smolderthorn", "Spinebreaker", "Spirestone", "Staghelm",
         "Steamwheedle Cartel", "Stonemaul", "Stormrage", "Stormreaver", "Stormscale", "Suramar", "Tanaris", "Terenas", "Terokkar",
         "Thaurissan", "The Forgotten Coast", "The Scryers", "The Underbog", "The Venture Co", "Thorium Brotherhood", "Thrall",
         "Thunderhorn", "Thunderlord", "Tichondrius", "Tol Barad", "Tortheldrin", "Trollbane", "Turalyon", "Twisting Nether",
         "Uldaman", "Uldum", "Undermine", "Ursin", "Uther", "Vashj", "Vek'nilash", "Velen", "Warsong", "Whisperwind",
         "Wildhammer", "Windrunner", "Winterhoof", "Wyrmrest Accord", "Ysera", "Ysondre", "Zangarmarsh", "Zul'jin", "Zuluhed"]
    @application = Playerapplication.new
  end

  def create
        @REALM_LIST = ["Aegwynn", "Aerie Peak", "Agamaggan", "Aggramar", "Akama", "Alexstrasza", "Alleria", "Altar of Storms", "Alterac Mountains",
         "Aman'Thul", "Anasterian", "Andorhal", "Anetheron", "Antonidas", "Anub'arak", "Anvilmar", "Arathor", "Archimonde", "Area 52",
         "Argent Dawn", "Arthas", "Arygos", "Auchindoun", "Azgalor", "Azjol-Nerub", "Azralon", "Azshara", "Azuremyst", "Baelgun",
         "Balnazzar", "Barthilas", "Benedictus", "Beta Leveling Realm 01", "Beta Leveling Realm 03",  "Beta Max Level PvP",
         "Black Dragonflight", "Blackhand", "Blackrock", "Blackwater Raiders", "Blackwing Lair", "Bladefist", "Blade's Edge",
         "Bleeding Hollow",  "Blood Furnace", "Bloodhoof", "Bloodscalp", "Bonechewer", "Borean Tundra", "Boulderfist",
         "Bronzebeard", "Broxigar",  "Burning Blade", "Burning Legion", "Caelestrasz", "Cairne", "Cenarion Circle", "Cenarius",
         "Cho'gall", "Chromaggus", "Coilfang", "Crushridge", "Daggerspine", "Dalaran", "Dalvengyr", "Dark Iron", "Darkspear",
         "Darrowmere", "Dath'Remar", "Dawnbringer", "Deathwing", "Demon Soul", "Dentarg", "Destromath", "Dethecus", "Detheroc",
         "Doomhammer", "Draenor", "Dragonblight", "Dragonmaw", "Draka", "Drakkari", "Drak'Tharon", "Drak'thul", "Dreadmaul",
         "Drenden", "Dunemaul", "Durotan", "Duskwood", "Earthen Ring", "Echo Isles", "Eitrigg", "Eldre'Thalas", "Elune",
         "Emerald Dream", "Eonar", "Eredar", "Executus", "Exodar", "Farstriders", "Feathermoon", "Fenris", "Firetree",
         "Fizzcrank", "Frostmane", "Frostmourne", "Frostwolf", "Galakrond", "Gallywix", "Garithos", "Garona", "Garrosh",
         "Ghostlands", "Gilneas", "Gnomeregan", "Goldrinn", "Gorefiend", "Gorgonnash", "Greymane", "Grizzly Hills", "Gul'dan",
         "Gundrak", "Gurubashi", "Hakkar", "Haomarush", "Hellscream", "Hydraxis", "Hyjal", "Icecrown", "Illidan", "Jaedenar",
         "Jubei'Thos", "Kael'thas", "Kalaran", "Kalecgos", "Kargath", "Kel'Thuzad", "Khadgar", "Khaz Modan", "Khaz'goroth",
         "Kil'jaeden", "Kilrogg", "Kirin Tor", "Korgath", "Korialstrasz", "Kul Tiras", "Laughing Skull", "Lethon", "Lightbringer",
         "Lightninghoof", "Lightning's Blade", "Llane", "Lothar", "Lycanthoth", "Madoran", "Maelstrom", "Magtheridon", "Maiev",
         "Malfurion", "Mal'Ganis", "Malorne", "Malygos", "Mannoroth", "Medivh", "Misha", "Mok'Nathal", "Moon Guard", "Moonrunner",
         "Mug'thol", "Muradin", "Nagrand", "Nathrezim", "Nazgrel", "Nazjatar", "Nemesis", "Ner'zhul", "Nesingwary",
         "Nordrassil", "Norgannon", "Onyxia", "Perenolde", "Proudmoore", "Quel'dorei", "Quel'Thalas", "Ragnaros", "Ravencrest",
         "Ravenholdt", "Rexxar", "Rivendare", "Runetotem", "Sargeras", "Saurfang", "Scarlet Crusade", "Scilla", "Sen'jin", "Sentinels",
         "Shadow Council", "Shadowmoon", "Shadowsong", "Shandris", "Shattered Halls", "Shattered Hand", "Shu'halo", "Silver Hand",
         "Silvermoon", "Sisters of Elune", "Skullcrusher", "Skywall", "Smolderthorn", "Spinebreaker", "Spirestone", "Staghelm",
         "Steamwheedle Cartel", "Stonemaul", "Stormrage", "Stormreaver", "Stormscale", "Suramar", "Tanaris", "Terenas", "Terokkar",
         "Thaurissan", "The Forgotten Coast", "The Scryers", "The Underbog", "The Venture Co", "Thorium Brotherhood", "Thrall",
         "Thunderhorn", "Thunderlord", "Tichondrius", "Tol Barad", "Tortheldrin", "Trollbane", "Turalyon", "Twisting Nether",
         "Uldaman", "Uldum", "Undermine", "Ursin", "Uther", "Vashj", "Vek'nilash", "Velen", "Warsong", "Whisperwind",
         "Wildhammer", "Windrunner", "Winterhoof", "Wyrmrest Accord", "Ysera", "Ysondre", "Zangarmarsh", "Zul'jin", "Zuluhed"]
    @application = Playerapplication.new(application_params)
    if verify_recaptcha(model: @application, message: 'ReCAPTCHA verification failed') && @application.save
      flash[:success] = 'Application Successful we will be in touch'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    return redirect_to root_url unless logged_in?
    redirect_to root_url unless current_user.admin? || current_user.dev?
    @applications = Playerapplication.page(params[:page]).per(20).order('created_at desc')
  end

  def show
    return redirect_to root_url unless params.key?(:viewkey) 
    @application = Playerapplication.find(params[:id])
    redirect_to root_url unless @application.viewkey == params[:viewkey] 
  end

  def destroy
    application = Playerapplication.find(params[:id])
    application.destroy!
    flash[:success] = 'Application deleted'
    redirect_to applications_path
  end

  private

  def authenticate_admin
    return redirect_to root_url unless logged_in?
    redirect_to root_url unless current_user.admin? || current_user.dev?
  end


  def application_params
    params.require(:playerapplication).permit(
      :player_name, :player_battlenettag,
      :player_realm, :player_class,
      :player_mainspec, :player_mainspec_awt,
      :player_offspec, :player_offspec_awt,
      :player_offspec_confidence,
      :player_alts, :player_previousguilds,
      :link_wowprogress, :link_warcraftlogs,
      :question_theorycraft,
      :question_whyyou, :question_whyremorse,
      :question_anythingelse
      )
  end

end
