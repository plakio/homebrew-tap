class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.73.tar.gz"
  sha256 "56a0aac308323b21c1aed3f7391f356e229c83426d97bc001cff0f09d9ab8b8b"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.73", shell_output("#{bin}/plak version")
  end
end
