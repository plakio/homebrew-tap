class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.61.tar.gz"
  sha256 "e717a37eb1381cc16be30fe79c580082d565d8b7d78ef61368dc73dae503abdf"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.61", shell_output("#{bin}/plak version")
  end
end
