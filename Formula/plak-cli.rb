class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.81.tar.gz"
  sha256 "af0bbb37e12b1166674fb6c0341081ab5f45ee1ecf420b279ef655bebd39da0f"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.81", shell_output("#{bin}/plak version")
  end
end
