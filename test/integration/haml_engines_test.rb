require 'helper'

class HamlEnginesTest < ActionDispatch::IntegrationTest

  context 'haml engine' do
    should 'setup role attribute' do
      get "/h"

      assert_tag  :tag => 'div', :attributes => { :role => 'implicitly_defined' }
      assert_tag  :tag => 'div', :attributes => { :role => 'explicitly_defined' }
      assert_tag  :tag => 'div', :attributes => { :role => 'foo bar' }
    end
  end

end
