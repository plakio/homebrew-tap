class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.74.tar.gz"
  sha256 "5a85c2c45d58b5207d0e505f0807b261e6439b54af07907ac26dae38998889a9"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.74", shell_output("#{bin}/plak version")
  end
end
