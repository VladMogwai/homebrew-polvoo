cask "polvoo" do
  version "1.0.6"

  if Hardware::CPU.arm?
    sha256 "3ba11e87cb76d9b9a30deb9dd55a43f4e235dfe68a47096863eb7bc24aaa94da"
    url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.6/Polvoo-1.0.6-arm64-mac.zip"
  else
    sha256 "e6cf2aa8762edbfbd7f79735eaa417de8a62336208eab4e6d2e84e961456b884"
    url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.6/Polvoo-1.0.6-mac.zip"
  end

  name "Polvoo"
  desc "Developer Project Dashboard — like Docker Desktop for local dev projects"
  homepage "https://github.com/VladMogwai/polvoo"

  app "Polvoo.app"

  uninstall quit: "com.polvoo.app",
            delete: "/Applications/Polvoo.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Polvoo.app"],
                   sudo: false
  end
end
