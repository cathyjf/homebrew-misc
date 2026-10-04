# SPDX-FileCopyrightText: Copyright 2026 Cathy J. Fitzpatrick <cathy@cathyjf.com>
# SPDX-License-Identifier: GPL-3.0-or-later

class GithubReleasePublisher < Formula
  desc "Publish GitHub releases through an interactive terminal interface"
  homepage "https://github.com/cathyjf/devicefs/tree/main/src/terminal/publisher"
  url "https://github.com/cathyjf/devicefs.git",
    revision: "5214bb889b8b7a15e245866635a09746911cac32"
  version "0.1"
  license "GPL-3.0-or-later"
  head "https://github.com/cathyjf/devicefs.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "lld" => :build
  depends_on "llvm" => :build
  depends_on "ninja" => :build
  depends_on "gh"
  depends_on "git"

  def install
    system "cmake", "--preset", "unix", "-S", "src/terminal", "-B", "build",
                   "-DDEVICEFS_TERMINAL_BUILD_TESTS=OFF", *std_cmake_args
    system "cmake", "--build", "build", "--config", "Release",
                   "--target", "github-release-publisher"
    bin.install "build/publisher/Release/github-release-publisher"
  end

  test do
    assert_match "Usage: github-release-publisher",
      shell_output("#{bin}/github-release-publisher --help")
    assert_match "option '--repository' requires a value",
      shell_output("#{bin}/github-release-publisher --repository 2>&1", 1)
  end
end
