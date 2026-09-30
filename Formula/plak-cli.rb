class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.63.tar.gz"
  sha256 "106ac9d5affdccdc038b5b1372a5d8734242914c439050fc73d0da6f90437292"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.63", shell_output("#{bin}/plak version")
  end
end
