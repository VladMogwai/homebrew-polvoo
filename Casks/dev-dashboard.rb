cask "dev-dashboard" do
  version "1.0.0"

  if Hardware::CPU.arm?
    sha256 "12fe4aea8cc8d9e501eafe745a219758e8e1637522ab95a4fe9bc826ee37b402"
    url "https://github.com/VladMogwai/dev-dashboard/releases/download/v1.0.0/Dev%20Dashboard-1.0.0-arm64-mac.zip"
  else
    sha256 "c3134bb48af076cf4d0f324394a308fc459cf389c18fb96975c297a6109ce5ea"
    url "https://github.com/VladMogwai/dev-dashboard/releases/download/v1.0.0/Dev%20Dashboard-1.0.0-mac.zip"
  end

  name "Dev Dashboard"
  desc "Developer Project Dashboard — like Docker Desktop for local dev projects"
  homepage "https://github.com/VladMogwai/dev-dashboard"

  app "Dev Dashboard.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Dev Dashboard.app"],
                   sudo: false
  end
end
