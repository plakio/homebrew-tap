class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.89.tar.gz"
  sha256 "8048ebcd3c7b084e01b7d631a0520d2c4bf4ab10ef787e2882dd18c471ac7c52"
  license "MIT"

  depends_on "gum"

  # Older standalone updaters replaced the Homebrew symlink with a
  # regular file. Let Homebrew back it up and relink the keg on upgrade.
  link_overwrite "bin/plak"

  def install
    system "./compile.sh"
    bin.install "plak.sh" => "plak"
  end

  test do
    assert_match "plak v0.4.89", shell_output("#{bin}/plak version")
  end
end
