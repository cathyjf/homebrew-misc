cask "keychain-interpose" do
  version "0.1.3"
  sha256 "c51ee25a2213527c1c47c3c8cf2cd87b92f845024bfb8dedb665e51a670bbcca"

  url "https://github.com/cathyjf/keychain-interpose/releases/download/v#{version}/keychain-interpose-v#{version}.zip"
  name "keychain-interpose"
  desc "Store GPG secret key files in the keychain"
  homepage "https://github.com/cathyjf/keychain-interpose"

  binary "keychain-interpose.app/Contents/MacOS/migrate-keys", target: "keychain-interpose-migrate-keys"
  binary "keychain-interpose.app/Contents/MacOS/pinentry-wrapper", target: "keychain-interpose-pinentry"
  binary "keychain-interpose.app/Contents/Resources/gpg-keychain-agent.sh", target: "keychain-interpose-agent"
end
