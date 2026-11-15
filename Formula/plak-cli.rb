class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.84.tar.gz"
  sha256 "06e8d50a9f05faca3f7c0b309b1c71617b002953b1c55ca31e11e9a370e1e99a"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.84", shell_output("#{bin}/plak version")
  end
end
