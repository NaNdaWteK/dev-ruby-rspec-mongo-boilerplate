require 'rack/test'
require 'json'

describe 'CONTROLER SYSTEM' do
  include Rack::Test::Methods

  def app
    App.new
  end

  it 'works' do
    expect(false).to be false
  end

  def parse_response
    JSON.parse(last_response.body)
  end
end
