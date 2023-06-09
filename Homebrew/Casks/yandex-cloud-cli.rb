cask "yandex-cloud-cli" do
  version "0.102.0"
  sha256 :no_check

  url "https://storage.yandexcloud.net/yandexcloud-yc/install.sh",
      verified: "yandexcloud.net/yandexcloud-yc/"
  name "Yandex Cloud CLI"
  homepage "https://cloud.yandex.com/docs/cli/"

  livecheck do
    url "https://cloud.yandex.com/en/docs/cli/release-notes"
    regex(/Version\s+(\d+(?:\.\d+)+)\s+\(/)
  end

  installer script: {
    executable: "install.sh",
    args:       ["-i", "#{staged_path}/#{token}", "-n"],
  }
  installer script: {
    executable: "yandex-cloud-cli/bin/yc",
    args:       ["components", "post-update"],
  }
  binary "yandex-cloud-cli/bin/docker-credential-yc"
  binary "yandex-cloud-cli/bin/yc"

  uninstall delete: "#{staged_path}/#{token}"

  caveats <<~EOS
    To install shell completions add this to your profile:

      for bash users
        source "#{staged_path}/#{token}/completion.bash.inc"

      for zsh users
        source "#{staged_path}/#{token}/completion.zsh.inc"
  EOS
end
