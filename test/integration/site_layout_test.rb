require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test 'layout links' do
    get root_path
    assert_template 'home/index'
    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', 'https://www.warcraftlogs.com/guilds/253726'
    assert_select 'a[href=?]', 'https://www.wowprogress.com/guild/us/frostmourne/Remorse'
  end
end
