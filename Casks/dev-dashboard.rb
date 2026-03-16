cask "dev-dashboard" do
  version "1.0.2"

  sha256 "df734c1733af195996527de7b897b431db2f31fa92a1432e4a5a53535c92a31f"
  url "https://github.com/VladMogwai/dev-dashboard/releases/download/v1.0.2/Dev.Dashboard-1.0.2-arm64-mac.zip"

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
