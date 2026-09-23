class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.56.tar.gz"
  sha256 "a052a7f5c98eef142cf25ad618506a2023ae7a257d981d39069c9ec4339c7a94"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.56", shell_output("#{bin}/plak version")
  end
end
