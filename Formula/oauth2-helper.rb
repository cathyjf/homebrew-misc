class Oauth2Helper < Formula
  desc "Facilitates sending mail with git-send-email(1)"
  homepage "https://github.com/cathyjf/oauth2-helper"
  url "git@github.com:cathyjf/oauth2-helper.git",
    using:    :git,
    tag:      "v0.1.2",
    revision: "443a661cfd275dbe7faeb581b417e843763a4857"

  depends_on "bash"
  depends_on "m4"
  depends_on "pass"
  depends_on "perl"

  def install
    prefix.install "cpanfile", "cpanfile.snapshot", "oauth2-helper.pl"
    IO.popen ["#{HOMEBREW_PREFIX}/opt/m4/bin/m4",
              "-DBASH_BINARY=#{HOMEBREW_PREFIX}/opt/bash/bin/bash",
              "oauth2-helper.m4"] do |io|
      File.write prefix/"oauth2-helper", io.read
    end
    chmod "u=rwx,go-rwx", prefix/"oauth2-helper"
    bin.install_symlink prefix/"oauth2-helper" => "cathyjf-oauth2-helper"
  end

  test do
    assert system("head", "-n", "1", prefix/"oauth2-helper")
  end
end
