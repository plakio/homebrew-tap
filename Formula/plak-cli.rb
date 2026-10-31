class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.70.tar.gz"
  sha256 "259641f3160580a7108cce167f71e99a0c89a5da86dc9592749b04281458bbf7"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.70", shell_output("#{bin}/plak version")
  end
end
