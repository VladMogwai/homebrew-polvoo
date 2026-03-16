cask "dev-dashboard" do
  version "1.0.4"

  if Hardware::CPU.arm?
    sha256 "d7eb86b7f95e13a3ae949e63819623190c20389b503e2c656950575fd8f90d50"
    url "https://github.com/VladMogwai/dev-dashboard/releases/download/v1.0.4/Dev.Dashboard-1.0.4-arm64-mac.zip"
  else
    sha256 "ffea529f9a284555f0921e8dc66773d612bdbb172275c752c7f6817059c98d88"
    url "https://github.com/VladMogwai/dev-dashboard/releases/download/v1.0.4/Dev.Dashboard-1.0.4-mac.zip"
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
