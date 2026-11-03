class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.76.tar.gz"
  sha256 "6d5fbc044b3c64edb254d5d2e291f15e3494ebe28d446447c436fabba61b6faf"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.76", shell_output("#{bin}/plak version")
  end
end
