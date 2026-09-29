class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.60.tar.gz"
  sha256 "68f3d3b8e0e75eafdc82bf29a1ddf8bb851210bc63513e189a8f7128fbc4d161"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.60", shell_output("#{bin}/plak version")
  end
end
