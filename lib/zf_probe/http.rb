module ZfProbe
  module HTTP
  extend ActiveSupport::Concern

    def do_request(data)
      Net::HTTP.post_form(ZfProbe::MONITOR_URL, data)
    end
  end
end
