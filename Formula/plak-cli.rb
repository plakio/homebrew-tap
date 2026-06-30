class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.45.tar.gz"
  sha256 "907dfab434a0efd325ffb009e3f89f9de548259c2d347545841169404f893f6c"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.45", shell_output("#{bin}/plak version")
    assert_match "Dependencies:", shell_output("#{bin}/plak status")
  end
end
