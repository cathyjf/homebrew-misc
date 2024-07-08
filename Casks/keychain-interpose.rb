cask "keychain-interpose" do
  version "0.1"
  sha256 "dd586248dcd123517779b02c47d31a01ebab3cd8363f7587b65a8e034e4c5342"

  url "https://github.com/cathyjf/keychain-interpose/releases/download/v#{version}/keychain-interpose-#{version}.zip"
  name "keychain-interpose"
  desc "Store GPG secret key files in the macOS keychain"
  homepage "https://github.com/cathyjf/keychain-interpose"

  binary "keychain-interpose.app/Contents/MacOS/migrate-keys", target: "keychain-interpose-migrate-keys"
  binary "keychain-interpose.app/Contents/MacOS/pinentry-wrapper", target: "keychain-interpose-pinentry"
  binary "keychain-interpose.app/Contents/Resources/gpg-keychain-agent.sh", target: "keychain-interpose-agent"
end
