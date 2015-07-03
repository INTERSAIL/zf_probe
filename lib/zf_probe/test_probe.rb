module ZfProbe
  class TestProbe
    include ZfProbe

    def monitor_url
      "http://localhost:3000/api/notifications"
    end

    def base_config
      {
          sc_id: "cf14c0cc-f754-46eb-8139-0996b0fadfcf",
          service_id: "57b5c2e9-0986-4caa-b0bc-dd2fd812257b",
          product_id: "92c403b2-fdff-4184-9f3e-ad16a2d89113",
          customer_id: "25eee987-4b49-4a6e-b7dc-326ae8bdc008"
      }
    end

    def after_notification(res)
      {data: res.to_h, code: res.code}
    end
  end
end