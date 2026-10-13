class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.66.tar.gz"
  sha256 "1c59e65b6288a1a00a1f80cc2203ed703c96cbb25c0c7e43a8df2e256774a728"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.66", shell_output("#{bin}/plak version")
  end
end
