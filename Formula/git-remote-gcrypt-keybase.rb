class GitRemoteGcryptKeybase < Formula
  desc "GPG-encrypted git remotes (with support for Keybase-encrypted git)"
  homepage "https://spwhitton.name/tech/code/git-remote-gcrypt/"
  url "https://github.com/cathyjf/git-remote-gcrypt/archive/1.5.1-keybase.tar.gz"
  version "1.5.1-keybase"
  sha256 "5524c814f84d1bad15f86e581dddcffa1fdf6b30e0da503bb50a3a7f516f87fc"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "docutils" => :build

  def install
    ENV["prefix"] = prefix
    system "./install.sh"
  end

  test do
    assert_match("fetch\npush\n", pipe_output("#{bin}/git-remote-gcrypt", "capabilities\n", 0))
  end
end
