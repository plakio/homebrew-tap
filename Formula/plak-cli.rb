class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.83.tar.gz"
  sha256 "5cedf1af7bf126ec0707dfcb7dca3be144dc37b94079a4d2d7705a3c8a3b815b"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.83", shell_output("#{bin}/plak version")
  end
end
