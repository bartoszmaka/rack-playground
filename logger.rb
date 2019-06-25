class Logger
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "Logger: #{Time.now} - #{env['REQUEST_URI']}"
    @app.call(env)
  end
end
