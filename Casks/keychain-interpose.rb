cask "keychain-interpose" do
  version "0.1.6"
  sha256 "9bf12735e5fd99c27760603617a611228f3ccba75bd6579e1ad5c09540e2771d"

  url "https://github.com/cathyjf/keychain-interpose/releases/download/v#{version}/keychain-interpose-v#{version}.zip"
  name "keychain-interpose"
  desc "Store GPG secret key files in the keychain"
  homepage "https://github.com/cathyjf/keychain-interpose"

  binary "keychain-interpose.app/Contents/MacOS/migrate-keys", target: "keychain-interpose-migrate-keys"
  binary "keychain-interpose.app/Contents/MacOS/pinentry-wrapper", target: "keychain-interpose-pinentry"
  binary "keychain-interpose.app/Contents/Resources/gpg-keychain-agent.sh", target: "keychain-interpose-agent"
end
