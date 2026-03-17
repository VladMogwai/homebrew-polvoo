cask "dev-dashboard" do
  version "1.0.5"

  sha256 "09a461e4486f88adcf4b18eab9b7d29a8bea5c23f63190ec88d74a8e10ba4426"
  url "https://github.com/VladMogwai/dev-dashboard/releases/download/v1.0.5/Dev.Dashboard-1.0.5-arm64-mac.zip"

  name "Dev Dashboard"
  desc "Developer Project Dashboard — like Docker Desktop for local dev projects"
  homepage "https://github.com/VladMogwai/dev-dashboard"

  app "Dev Dashboard.app"

  uninstall quit: "com.devdashboard.app",
            delete: "/Applications/Dev Dashboard.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Dev Dashboard.app"],
                   sudo: false
  end
end
