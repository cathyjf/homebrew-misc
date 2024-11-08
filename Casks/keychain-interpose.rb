cask "keychain-interpose" do
  version "0.1.2"
  sha256 "149ef266a4cf093d3271cb5367fcb72b57215420c544d17f0c942d4ce266df30"

  url "https://github.com/cathyjf/keychain-interpose/releases/download/v#{version}/keychain-interpose-v#{version}.zip"
  name "keychain-interpose"
  desc "Store GPG secret key files in the keychain"
  homepage "https://github.com/cathyjf/keychain-interpose"

  binary "keychain-interpose.app/Contents/MacOS/migrate-keys", target: "keychain-interpose-migrate-keys"
  binary "keychain-interpose.app/Contents/MacOS/pinentry-wrapper", target: "keychain-interpose-pinentry"
  binary "keychain-interpose.app/Contents/Resources/gpg-keychain-agent.sh", target: "keychain-interpose-agent"
end
