class Io < Formula
  desc "Minimal AI harness with a shell, powered by the Pi SDK"
  homepage "https://github.com/plakio/io"
  url "https://github.com/plakio/io/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "c90f613ae4c2d8f4a2b2c86e03809986eb6ce50f761c908a902c4dfc3c31fb35"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "ci", "--ignore-scripts"
    system "npm", "run", "build"
    libexec.install "dist", "package.json", "LICENSE"
    (bin/"io").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/cli.js" "$@"
    EOS
    chmod 0755, bin/"io"
  end

  test do
    assert_match "io 0.1.5", shell_output("#{bin}/io --version")
    assert_match "Usage:", shell_output("#{bin}/io --help")
    assert_predicate libexec/"LICENSE", :exist?
    assert_predicate libexec/"dist/THIRD_PARTY_NOTICES.txt", :exist?
  end
end
