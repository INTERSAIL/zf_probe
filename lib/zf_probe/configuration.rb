module ZfProbe
  module Configuration
    extend ActiveSupport::Concern

    # You need to override this
    def base_config
      {
          sc_id: "1",
          customer_id: "2",
          product_id: "3",
          service_id: "4",
      }
    end

    # You need to override this
    def monitor_url
      "http://the-monitor-url.com:3000"
    end
  end
end
