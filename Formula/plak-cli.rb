class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.68.tar.gz"
  sha256 "e916d95286ecb5ec2dcb300edd7f5acfd212489ff72ce9e685fd938f0a7377bb"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.68", shell_output("#{bin}/plak version")
  end
end
