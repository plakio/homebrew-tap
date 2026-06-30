class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.46.tar.gz"
  sha256 "855c6daaf60496310fac2654f5281be10fc72dc5362865c838241ec06ca74d6a"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.46", shell_output("#{bin}/plak version")
    assert_match "Dependencies:", shell_output("#{bin}/plak status")
  end
end
