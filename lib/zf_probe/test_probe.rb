module ZfProbe
  class TestProbe
    include ZfProbe

    def monitor_url
      "http://localhost:3000/api/notifications"
    end

    def after_notification(res)
      res.to_h
    end
  end
end