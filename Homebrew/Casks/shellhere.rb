cask "shellhere" do
  version "1.1"
  sha256 :no_check

  url "https://github.com/downloads/lhagan/ShellHere/ShellHere.dmg"
  name "ShellHere"
  desc "Toolbar app for Finder that opens the current location in Terminal"
  homepage "https://github.com/lhagan/ShellHere/"

  livecheck do
    url :url
    strategy :extract_plist
  end

  app "ShellHere.app"
end
