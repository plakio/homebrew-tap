class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.79.tar.gz"
  sha256 "c9fcc04c0e460eed27129c947cc04df6653a9dff967325680ccf63282be45fe4"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.79", shell_output("#{bin}/plak version")
  end
end
