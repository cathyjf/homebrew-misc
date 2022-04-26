class GitRemoteGcryptKeybase < Formula
  desc "GPG-encrypted git remotes (with support for Keybase-encrypted git)"
  homepage "https://spwhitton.name/tech/code/git-remote-gcrypt/"
  url "https://github.com/spwhitton/git-remote-gcrypt/archive/bba438fff4e35fb2008c9efeba26d40985294422.tar.gz"
  version "1.5-1"
  sha256 "5402b7232d6c7f861f1a60f4586f41d2faae9c9dbf5d5f800cbd2465c9a9b0a6"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/cathyjf/homebrew-misc/raw/bottles"
    sha256 cellar: :any_skip_relocation, monterey: "ba2883171e40a4243fa2d9a9ab397254983091ad2c55dbe955266250a458521d"
  end

  depends_on "docutils" => :build

  conflicts_with "git-remote-gcrypt",
    because: "git-remote-gcrypt-keybase also ships a git-remote-gcrypt binary"

  patch :DATA

  def install
    ENV["prefix"] = prefix
    system "./install.sh"
  end

  test do
    assert_match("fetch\npush\n", pipe_output("#{bin}/git-remote-gcrypt", "capabilities\n", 0))
  end
end

__END__
From 79f7db37810a0f72995ab555ac904b81ddfb9f1e Mon Sep 17 00:00:00 2001
From: "Cathy J. Fitzpatrick" <cathy@cathyjf.com>
Date: Sat, 12 Oct 2019 10:46:37 -0700
Subject: [PATCH] Add workaround for broken keybase fetch

---
 git-remote-gcrypt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/git-remote-gcrypt b/git-remote-gcrypt
index 7e7240f..290a854 100755
--- a/git-remote-gcrypt
+++ b/git-remote-gcrypt
@@ -26,6 +26,7 @@ set -f # noglob
 set -C # noclobber
 
 export GITCEPTION="${GITCEPTION:-}+" # Reuse $Gref except when stacked
+Gitception_remote="_gcrypt_gitception$GITCEPTION"
 Gref="refs/gcrypt/gitception$GITCEPTION"
 Gref_rbranch="refs/heads/master"
 Packkey_bytes=63  # nbr random bytes for packfile keys, any >= 256 bit is ok
@@ -163,7 +164,9 @@ gitception_get()
 	# Take care to preserve FETCH_HEAD
 	local ret_=: obj_id= fet_head="$GIT_DIR/FETCH_HEAD"
 	[ -e "$fet_head" ] && command mv -f "$fet_head" "$fet_head.$$~" || :
-	git fetch -q -f "$1" "$Gref_rbranch:$Gref" >/dev/null &&
+	git remote add "$Gitception_remote" "$1" 2>/dev/null ||
+		git remote set-url "$Gitception_remote" "$1"
+	git fetch -q -f "$Gitception_remote" "$Gref_rbranch:$Gref" >/dev/null &&
 		obj_id="$(git ls-tree "$Gref" | xgrep -E '\b'"$2"'$' | awk '{print $3}')" &&
 		isnonnull "$obj_id" && git cat-file blob "$obj_id" && ret_=: ||
 		{ ret_=false && : ; }
