class Io < Formula
  desc "Minimal AI harness with a shell, powered by the Pi SDK"
  homepage "https://github.com/plakio/io"
  url "https://github.com/plakio/io/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b445984c7c3e3dd33bdbab85cadb69b9b80bf10f046661e3264af53f950cbd21"
  # The IO project license is pending. Do not add a license declaration yet.

  depends_on "node"

  def install
    system "npm", "ci", "--ignore-scripts"
    system "npm", "run", "build"
    libexec.install "dist", "package.json"
    (bin/"io").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/cli.js" "$@"
    EOS
    chmod 0755, bin/"io"
  end

  test do
    assert_match "io 0.1.0", shell_output("#{bin}/io --version")
    assert_match "Usage:", shell_output("#{bin}/io --help")
    assert_predicate libexec/"dist/THIRD_PARTY_NOTICES.txt", :exist?
  end
end
