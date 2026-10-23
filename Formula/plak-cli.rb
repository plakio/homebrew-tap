class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.69.tar.gz"
  sha256 "a76787a889a2d9cb2e654d8356ebc780a4151ee68dde5b23bca063b6be3cc5cf"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.69", shell_output("#{bin}/plak version")
  end
end
