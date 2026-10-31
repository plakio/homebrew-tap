class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.71.tar.gz"
  sha256 "dd2ac1ea5b68dfb06d78ef22122aaaf30922e79418f235a5466afebc1c8047b1"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.71", shell_output("#{bin}/plak version")
  end
end
