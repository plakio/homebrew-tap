class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.78.tar.gz"
  sha256 "4baff34f1776bc35ea824450ffcc52783ab00a45a46f0f2eb2deb0256359c337"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.78", shell_output("#{bin}/plak version")
  end
end
