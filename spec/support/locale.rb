# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each, type: :controller) do
    @request.env['HTTP_ACCEPT_LANGUAGE'] = 'en'
  end
end
