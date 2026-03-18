cask "polvoo" do
  version "1.0.8"

  if Hardware::CPU.arm?
    sha256 "47290f4edf5c98f55fa519f537411643be64a7f1681c1aef8850d57e2d51c228"
    url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.8/Polvoo-1.0.8-arm64-mac.zip"
  else
    sha256 "288869365bc49c3fd6323694bd2563a492add45e91de75c4f72c3de21b720781"
    url "https://github.com/VladMogwai/polvoo/releases/download/v1.0.8/Polvoo-1.0.8-mac.zip"
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
