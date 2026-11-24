class Io < Formula
  desc "Minimal AI harness with an embedded OpenCode engine and OpenTUI"
  homepage "https://github.com/plakio/io"
  url "https://github.com/plakio/io/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "8fed4f96182978d373ab91cb5313cd9bf9e9e4dfa37ff69970c20cb4ea33d06a"
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
    assert_match "io 0.3.0", shell_output("#{bin}/io --version")
    assert_match "Usage:", shell_output("#{bin}/io --help")
    assert_predicate libexec/"LICENSE", :exist?
    assert_predicate libexec/"THIRD_PARTY_NOTICES.txt", :exist?
  end
end
