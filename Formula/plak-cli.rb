class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.62.tar.gz"
  sha256 "dba643f647f9346dad589407a581edb934e89cc37558588ad47b4a8b52137330"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.62", shell_output("#{bin}/plak version")
  end
end
