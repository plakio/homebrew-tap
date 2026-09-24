class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.57.tar.gz"
  sha256 "566d926b58e9855ddbe4b905e46d7e2644ecd953aaaa0a10382b9af722cb81f1"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.57", shell_output("#{bin}/plak version")
  end
end
