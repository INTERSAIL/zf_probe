module ZfProbe
  class TestProbe
    include ZfProbe

    def monitor_url
      "http://iMac-di-Jacopo.sail.local:3000/api/notifications"
    end

    def after_notification(res)
      res
    end
  end
end