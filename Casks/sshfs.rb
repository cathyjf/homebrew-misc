cask "sshfs" do
  version "2.5.0"
  sha256 "f8f4f71814273ea42dbe6cd92199f7cff418571ffd1b10c0608878d3472d2162"

  url "https://github.com/osxfuse/sshfs/releases/download/osxfuse-sshfs-#{version}/sshfs-#{version}.pkg",
      verified: "github.com/osxfuse/sshfs/"
  name "sshfs"
  desc "File system client based on SSH File Transfer Protocol"
  homepage "https://osxfuse.github.io/"

  conflicts_with formula: ["homebrew/core/sshfs", "homebrew/core/sshfs-mac", "gromgit/fuse/sshfs-mac"]
  depends_on cask: "macfuse"

  pkg "sshfs-#{version}.pkg"

  uninstall pkgutil: "com.github.osxfuse.pkg.SSHFS"
end
