class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.51.tar.gz"
  sha256 "fa57639cf01a0700105497436b22d2680bef9804cabc06f946b64f1d91aff057"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.51", shell_output("#{bin}/plak version")
    assert_match "Dependencies:", shell_output("#{bin}/plak status")
  end
end
