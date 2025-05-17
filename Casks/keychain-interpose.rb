cask "keychain-interpose" do
  version "0.1.5"
  sha256 "4328b100b580448296b4b8277f23f18de5c09ce234993b835c3fe176b3da81ab"

  url "https://github.com/cathyjf/keychain-interpose/releases/download/v#{version}/keychain-interpose-v#{version}.zip"
  name "keychain-interpose"
  desc "Store GPG secret key files in the keychain"
  homepage "https://github.com/cathyjf/keychain-interpose"

  binary "keychain-interpose.app/Contents/MacOS/migrate-keys", target: "keychain-interpose-migrate-keys"
  binary "keychain-interpose.app/Contents/MacOS/pinentry-wrapper", target: "keychain-interpose-pinentry"
  binary "keychain-interpose.app/Contents/Resources/gpg-keychain-agent.sh", target: "keychain-interpose-agent"
end
