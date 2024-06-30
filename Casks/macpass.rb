cask "macpass" do
  version "0.8.1.1"
  sha256 "90317e1238d71a589781624d4b1635667bcec428a704beb4b899a127e6e28122"

  url "https://github.com/cathyjf/MacPass/releases/download/#{version}/MacPass-#{version}.zip",
      verified: "github.com/cathyjf/MacPass/"
  name "MacPass"
  desc "Open-source, KeePass-client and password manager"
  homepage "https://macpass.github.io/"

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "MacPass.app"

  uninstall quit: "com.cathyjf.hicknhacksoftware.MacPass"

  zap delete: [
    "~/Library/Application Support/MacPass",
    "~/Library/Caches/com.cathyjf.hicknhacksoftware.MacPass",
    "~/Library/Cookies/com.cathyjf.hicknhacksoftware.MacPass.binarycookies",
    "~/Library/HTTPStorages/com.cathyjf.hicknhacksoftware.MacPass",
    "~/Library/Preferences/com.cathyjf.hicknhacksoftware.MacPass.plist",
    "~/Library/Saved Application State/com.cathyjf.hicknhacksoftware.MacPass.savedState",
  ]
end
