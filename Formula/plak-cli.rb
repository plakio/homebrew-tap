class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.54.tar.gz"
  sha256 "d478421eba9a030544d6093d90dc353956d3c48eb0dc478c91c93a3f106c9852"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.54", shell_output("#{bin}/plak version")
  end
end
