class Hello
  def call(env)
    case env['REQUEST_URI']
    when %r{^/$}
      [200, headers, ['Hello']]
    when /info/
      [200, headers, [pretty_env(env)]]
    else
      [404, headers, ['Not found']]
    end
  end

  private

  def headers
    { 'Content-Type' => 'text/html' }
  end

  def pretty_env(env)
    env.each_with_object('') do |(key, value), object|
      object << "#{key} => #{value}</br>"
    end
  end
end
