class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.59.tar.gz"
  sha256 "3a00374e42c9b0befa6db1d93a4f9c1676df961d922c3479651f2d54dce02ea1"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.59", shell_output("#{bin}/plak version")
  end
end
