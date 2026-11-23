class Io < Formula
  desc "Minimal AI harness with an embedded OpenCode engine and OpenTUI"
  homepage "https://github.com/plakio/io"
  url "https://github.com/plakio/io/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "ea23fca8313c032226f6d8205d61cc2938de2017116b94ebdd1692fa721db1ab"
  license "MIT"

  depends_on "bun" => :build
  depends_on "node" => :build

  def install
    system "npm", "ci", "--ignore-scripts", "--no-audit", "--no-fund"
    system "npm", "run", "build"
    libexec.install Dir["dist-next/*"]
    bin.install_symlink libexec/"io" => "io"
  end

  test do
    assert_match "io 0.2.1", shell_output("#{bin}/io --version")
    assert_match "Usage:", shell_output("#{bin}/io --help")
    assert_predicate libexec/"LICENSE", :exist?
    assert_predicate libexec/"THIRD_PARTY_NOTICES.txt", :exist?
  end
end
