Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://huygenswatches.netlify.app, http://localhost:5173' # Replace '*' with the specific origin(s) you want to allow

    # The resource(s) to allow CORS for
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
