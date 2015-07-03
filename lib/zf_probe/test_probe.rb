module ZfProbe
  class TestProbe
    include ZfProbe

    def monitor_url
      "http://localhost:3000/api/notifications"
    end

    def base_config
      {
          sc_id: "17ef0998-3864-4037-b694-dd2c6e9a9a99",
          customer_id: "312f3715-a885-4799-a839-b8d34aa69b76",
          product_id: "a74b29fd-cd1e-47dc-a918-473c3fe27c0b",
          service_id: "23cd9b32-25e5-4b9f-8423-6848ede55950",
      }
    end

    def after_notification(res)
      {data: res.to_h, code: res.code}
    end
  end
end