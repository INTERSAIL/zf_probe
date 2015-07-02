module ZfProbe
  class TestProbe
    include ZfProbe
    # include HTTP

    MONITOR_URL = "http://iMac-di-Jacopo.sail.local:3000/api/notifications"

    def after_notification(res)
      res
    end
  end
end