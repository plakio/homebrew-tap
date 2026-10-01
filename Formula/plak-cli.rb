class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.64.tar.gz"
  sha256 "e69725c82e649cf71d9a1b24086ec61eb5e78f2061d061beb1b26894e2a825b0"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.64", shell_output("#{bin}/plak version")
  end
end
