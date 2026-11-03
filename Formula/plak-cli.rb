class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.77.tar.gz"
  sha256 "b265d7406cb27de0984584a6a1e16126c15a0eb5af743ca8a4aebb28685580d4"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.77", shell_output("#{bin}/plak version")
  end
end
