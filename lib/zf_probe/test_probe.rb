module ZfProbe
  class TestProbe
    include ::ZfProbe

    MONITOR_URL = "http://iMac-di-Jacopo.sail.local:3000/api/notifications"

    def after_notification(res)
      res
    end
  end
end