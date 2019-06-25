class AuthMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    if token_valid?(env)
      [status, headers, body]
    else
      [401, headers, ['Unauthorized']]
    end
  end

  private

  def token_valid?(env)
    params = query_params(env)

    params['token'] == '123'
  end

  def query_params(env)
    env['QUERY_STRING'].split('&').each_with_object({}) do |pair, result|
      key, value = pair.split('=')
      result[key] = value
    end
  end
end
