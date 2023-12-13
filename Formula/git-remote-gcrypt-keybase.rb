class GitRemoteGcryptKeybase < Formula
  desc "GPG-encrypted git remotes (with extra features added by cathyjf)"
  homepage "https://bitbucket.org/cathyjf/git-remote-gcrypt"
  url "https://bitbucket.org/cathyjf/git-remote-gcrypt.git",
    tag: "cathyjf/1.6.1.1",
    revision: "642ce560a0faf27a573661b76404a33e604917c0"
  license "GPL-2.0-or-later"

  depends_on "docutils" => :build

  conflicts_with "git-remote-gcrypt",
    because: "git-remote-gcrypt-keybase also ships a git-remote-gcrypt binary"

  def install
    ENV["prefix"] = prefix
    system "./install.sh"
  end

  test do
    assert_match("fetch\npush\n", pipe_output("#{bin}/git-remote-gcrypt", "capabilities\n", 0))
  end
end
