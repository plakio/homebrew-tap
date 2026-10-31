class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.72.tar.gz"
  sha256 "7a7ad3b2d427bcb062a4bb8324d83d7df9b6f230e78a9109d66de1f930dde944"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.72", shell_output("#{bin}/plak version")
  end
end
