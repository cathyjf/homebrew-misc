class GnupgAT120 < Formula
  desc "GnuPG"
  homepage "https://www.gnupg.org"
  url "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-1.2.0.tar.bz2"
  sha256 "f68de6ed33cb51db62d775443318cbd7631fb5e101949808db755acc667d997b"
  license license "GPL-2.0-or-later"

  keg_only :versioned_formula

  def install
    ENV.append_to_cflags "-std=c89"
    system "./configure", *std_configure_args, "--disable-silent-rules",
      "--mandir=#{man}", "--infodir=#{info}"
    system "make", "install"
  end

  test do
    assert_match(/.*gpg \(GnuPG\) 1\.2\.0.*/m, shell_output("#{bin}/gpg --homedir . --version"))
  end
end
