class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.53.tar.gz"
  sha256 "9cbafd93ca331e5cf0eaca9fe509a558b7218f1b9f5624ce1f6524752cc4e8a1"
  license "MIT"

  depends_on "gum"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.53", shell_output("#{bin}/plak version")
    assert_match "Dependencies:", shell_output("#{bin}/plak status", 1)
  end
end
