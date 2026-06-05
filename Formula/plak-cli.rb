class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.42.tar.gz"
  sha256 "23bf7af32b938fa0010c9f4c89cd58679ae13792fe5f0ce283c7249cc578e4e7"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.42", shell_output("#{bin}/plak version")
    assert_match "Dependencies:", shell_output("#{bin}/plak status")
  end
end
