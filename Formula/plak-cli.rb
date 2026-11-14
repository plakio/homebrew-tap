class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.82.tar.gz"
  sha256 "b9d9d33011acf6e9e9cd3c26fc002ff98c012950dead5406ab8bee110cd4ebad"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.82", shell_output("#{bin}/plak version")
  end
end
