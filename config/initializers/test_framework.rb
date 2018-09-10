Rails.application.config.generators do |g|
  # RSpec
  g.test_framework :rspec,
                   fixture: true,
                   controller_specs: true,
                   view_specs: false,
                   helper_specs: false,
                   routing_specs: false,
                   request_specs: false
  # FactoryGirl
  g.fixture_replacement :factory_girl, dir: 'spec/factories'
end
