module ZfProbe
  module HTTP
  extend ActiveSupport::Concern

    def do_request(data)
      Net::HTTP.post(ZfProbe::MONITOR_URL, data)
    end
  end
end
