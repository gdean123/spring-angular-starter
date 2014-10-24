require 'open3'

class TestServer
  def start
    @pid = Process.spawn 'SPRING_PROFILES_ACTIVE=test ./gradlew bootRun'
    sleep(1) until server_started?
  end

  def stop
    Process.kill 'TERM', @pid
    Process.wait @pid
  end

  private

  def server_started?
    Open3.popen3('curl http://localhost:8181') do |_, _, _, wait_thread|
        return wait_thread.value.success?
    end
  end
end