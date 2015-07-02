module ZfProbe
  module Configuration
    extend ActiveSupport::Concern

    # You need to override this
    def base_config
      {
          sc_id: "befc35e9-aef5-4efc-a898-2a4db75876d2",
          customer_id: "d680708d-5c82-4adf-b84e-8d93811684dd",
          product_id: "a9b0ad3a-3d7d-45f2-987e-040fd022a569",
          service_id: "24a2936e-b687-4b4e-8d20-0090436b6cda",
      }
    end

    # You need to override this
    def monitor_url
      "http://the-monitor-url.com:3000"
    end
  end
end
