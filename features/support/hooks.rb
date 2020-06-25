# frozen_string_literal: true

require 'base64'

Before do
  Capybara.reset_sessions!
  Capybara.default_normalize_ws = true
  @inicial = InicialPage.new
  @resultado = ResultPage.new
  page.current_window.resize_to(1440, 900)
end

After do
  # if scenario.failed?
  sleep 3
  tempshot = page.save_screenshot("log/tempshot.png")
  screenshot = Base64.strict_encode64(File.open(tempshot).read)
  embed(screenshot, "image/png", 'Screenshot')
  # end
end
