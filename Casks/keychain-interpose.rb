cask "keychain-interpose" do
  version "0.1.1"
  sha256 "56abb42d2acbc69635fbab0352fd2badbf6e40954d857d03d2eb35208d3efd48"

  url "https://github.com/cathyjf/keychain-interpose/releases/download/v#{version}/keychain-interpose-#{version}.zip"
  name "keychain-interpose"
  desc "Store GPG secret key files in the keychain"
  homepage "https://github.com/cathyjf/keychain-interpose"

  binary "keychain-interpose.app/Contents/MacOS/migrate-keys", target: "keychain-interpose-migrate-keys"
  binary "keychain-interpose.app/Contents/MacOS/pinentry-wrapper", target: "keychain-interpose-pinentry"
  binary "keychain-interpose.app/Contents/Resources/gpg-keychain-agent.sh", target: "keychain-interpose-agent"
end
