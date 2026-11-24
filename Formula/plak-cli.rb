class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.94.tar.gz"
  sha256 "c56866caada90173cd5b692462579045af3794c8ad9c905af92f646c5c463701"
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
    assert_match "plak v0.4.94", shell_output("#{bin}/plak version")
  end
end
