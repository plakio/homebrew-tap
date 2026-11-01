class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.75.tar.gz"
  sha256 "53be24e08ad62169715b8119b0f815bb9379cf78add57b912c823e283edf0a7b"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.75", shell_output("#{bin}/plak version")
  end
end
