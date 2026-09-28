class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.58.tar.gz"
  sha256 "1eec541cd98ec1e93a196835fefbb98c83a3750293af8b4590e1a9f2bde09198"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.58", shell_output("#{bin}/plak version")
  end
end
