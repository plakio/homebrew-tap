class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.86.tar.gz"
  sha256 "a4ce8d8d002ae4cae16a1d8f9d2b7c7d3fbaceec55a64742b87fab4f8f5fecdc"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.86", shell_output("#{bin}/plak version")
  end
end
