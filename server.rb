require "sinatra"
require "yaml"
require "fileutils"

configure do
  # logging is enabled by default in classic style applications,
  # so `enable :logging` is not needed
  log_filename = "#{settings.root}/log/#{settings.environment}.log"
  FileUtils.mkdir_p File.dirname(log_filename)
  file = File.new(log_filename, 'a+')

  file.sync = true
  use Rack::CommonLogger, file
end

def log_request
  logger.info "#{request.env["REQUEST_METHOD"]} #{request.env["PATH_INFO"]}"

  request.body.rewind
  body_str = request.body.read

  if body_str && !body_str.empty?
    begin
      json_body = JSON.parse body_str
      logger.info "JSON body:\n---\n#{JSON.pretty_generate(json_body)}\n---\n"
    rescue JSON::ParserError => exception
      logger.warn "JSON body parsing failed: #{exception}"
    end
  else
    logger.debug "No response body"
  end

  nil
end

after do
  log_request
end

get "/*" do
  nil
end

post "/*" do
  nil
end
