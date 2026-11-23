class Io < Formula
  desc "Minimal AI harness with an embedded OpenCode engine and OpenTUI"
  homepage "https://github.com/plakio/io"
  url "https://github.com/plakio/io/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "5b111ccf6fa3ed4d3ccc46465ad8991f348a4b1fc57ac634a57a243b0d7de4d2"
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
    assert_match "io 0.2.2", shell_output("#{bin}/io --version")
    assert_match "Usage:", shell_output("#{bin}/io --help")
    assert_predicate libexec/"LICENSE", :exist?
    assert_predicate libexec/"THIRD_PARTY_NOTICES.txt", :exist?
  end
end
