cask "virtual-ii" do
  version "11.3.1"
  sha256 :no_check

  url "https://virtualii.com/VirtualII.dmg"
  name "Virtual ]["
  homepage "https://virtualii.com/"

  livecheck do
    url :homepage
    regex(/version\s+(\d+(?:\.\d+)+)/i)
  end

  suite "Virtual ]["

  preflight do
    # There is no sub-folder in the DMG; the root *is* the folder
    FileUtils.mv(staged_path.children, staged_path.join("Virtual ][").tap(&:mkpath))
  end

  caveats <<~EOS
    This app requires a ROM image, which must be downloaded and installed
    separately. See #{homepage}VirtualIIHelp/virtual_II_help.html#ROMImage
    for more info.
  EOS
end
