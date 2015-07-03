module ZfProbe
  module HTTP
    extend ActiveSupport::Concern

    def do_request(data)
      HTTParty.post(monitor_url, body: data)
    end
  end
end
