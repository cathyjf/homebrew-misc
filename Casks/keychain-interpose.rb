cask "keychain-interpose" do
  version "0.1.7"
  sha256 "5e0edba80d77073ba7d9713f186877d6158251706a5f88a998673075777df2cd"

  url "https://github.com/cathyjf/keychain-interpose/releases/download/v#{version}/keychain-interpose-v#{version}.zip"
  name "keychain-interpose"
  desc "Store GPG secret key files in the keychain"
  homepage "https://github.com/cathyjf/keychain-interpose"

  binary "keychain-interpose.app/Contents/MacOS/migrate-keys", target: "keychain-interpose-migrate-keys"
  binary "keychain-interpose.app/Contents/MacOS/pinentry-wrapper", target: "keychain-interpose-pinentry"
  binary "keychain-interpose.app/Contents/Resources/gpg-keychain-agent.sh", target: "keychain-interpose-agent"
end
