# frozen_string_literal: true

Rswag::Api.configure do |c|
  # Specify a root folder where Swagger JSON files are located
  # This is used by the Swagger middleware to serve requests for API descriptions
  # NOTE: If you're using rswag-specs to generate Swagger, you'll need to ensure
  # that it's configured to generate files in the same folder

  # rubocop:disable Rails/FilePath
  # rubocop:disable Lint
  c.swagger_root = "#{Rails.root.to_s}/swagger"
  # rubocop:enable Rails/FilePath
  # rubocop:enable Lint

  # c.swagger_root = Rails.root.join('swagger')

  # Inject a lambda function to alter the returned Swagger prior to serialization
  # The function will have access to the rack env for the current request
  # For example, you could leverage this to dynamically assign the "host" property
  #
  # c.swagger_filter = lambda { |swagger, env| swagger['host'] = env['HTTP_HOST'] }
end
