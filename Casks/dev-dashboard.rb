cask "dev-dashboard" do
  version "1.0.1"

  if Hardware::CPU.arm?
    sha256 "9438ecf1439e4d6310e8803261efabdabf7a148951b73a22f07da835a8f3d1b6"
    url "https://github.com/VladMogwai/dev-dashboard/releases/download/v1.0.1/Dev.Dashboard-1.0.1-arm64-mac.zip"
  else
    sha256 "0a087423bbcd26cd670cadf0899b4717bcf45dd30e36bc1ee13f2293042d6203"
    url "https://github.com/VladMogwai/dev-dashboard/releases/download/v1.0.1/Dev.Dashboard-1.0.1-mac.zip"
  end

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
