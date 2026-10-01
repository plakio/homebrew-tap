class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.65.tar.gz"
  sha256 "af1cb9d052d0f165a42eff4a144fbbc9bf98664f152b26491862bd407cd37b76"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.65", shell_output("#{bin}/plak version")
  end
end
