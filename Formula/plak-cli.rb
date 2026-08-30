class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.55.tar.gz"
  sha256 "1f4d0481838ba8bfa840fbfb9404130639261ceb5904d28705669b00fc7023a2"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.55", shell_output("#{bin}/plak version")
  end
end
