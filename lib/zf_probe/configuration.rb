module ZfProbe
  module Configuration
    extend ActiveSupport::Concern

    def base_config
      {
          sc_id: "1",
          customer_id: "2",
          product_id: "3",
          service_id: "4",
      }
    end

    def monitor_url
      "http://the-monitor-url.com:3000"
    end
  end
end
