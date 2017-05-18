# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == 'development'
  99.times do |n|
  Post.create(title: "I got #{n + 1} problems",
              short_desc: "But a bitch ain't one",
              content: 'Hello Worlds',
              published: true
             )
  end
end
User.create(name: 'ishy', email: 'ishy@live.com.au', password: 'changeme', access_level: "dev")
User.create(name: 'xtda', email: 'andrew@disvelop.net', password: 'changeme', access_level: "dev")

recruitment = JSON.parse('{"class":{"mage":{"fire":false,"frost":false,"arcane":false},"monk":{"brewmaster":false,"mistweaver":false,"windwalker":false},"druid":{"feral":false,"balance":false,"guardian":false,"restoration":false},"rogue":{"class":false,"outlaw":false,"subtlety":false,"assassination":false},"hunter":{"survival":false,"beastmastery":false,"marksmanship":false},"priest":{"holy":false,"shadow":false,"discipline":false},"shaman":{"elemental":false,"enhancement":false,"restoration":false},"paladin":{"holy":false,"protection":false,"retribution":false},"warlock":{"affliction":false,"demonology":false,"destruction":false},"warrior":{"arms":false,"fury":false,"protection":false},"deathknight":{"blood":false,"class":false,"frost":false,"unholy":false},"demonhunter":{"havoc":false,"vengeance":false}}}')
Setting.create(name: 'recruitment', setting: recruitment)

post_content = %'<b>Remorse</b> is a 3 day a week progression guild that was formed\nwith multiple talented and mechanically well versed players that\nhost extensive game knowledge whom want to progress on a more laid\nback schedule.<br>\n<br>\n<b>Raid Times:</b><br>\n<ul>\n<li>Wednesday: 8:00pm – 11:00pm SVT (Invites @ 7:45pm)</li>\n<li>Sunday: 8:00pm – 11:00pm SVT (Invites @ 7:45pm)</li>\n<li>Monday: 8:00pm – 11:00pm SVT (Invites @ 7:45pm)</li>\n</ul>\n<br>\nIshyy - Ishy#1805<br>\nElmasterbato - Elmasterbato#1339<br>\nPharma - MauiWowie#1402<br>'
Post.create(title: 'Remorse',
            content: post_content,
            featurette: true
)


  99.times do |n|
  Playerapplication.create(title: "I got #{n + 1} problems",
              short_desc: "But a bitch ain't one",
              content: 'Hello Worlds',
              published: true
             )
  end