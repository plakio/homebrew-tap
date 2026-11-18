class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.90.tar.gz"
  sha256 "2757bcb58e427f11e91071feb351c34a4f801e6b1557982bfe461fc393536ece"
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
    assert_match "plak v0.4.90", shell_output("#{bin}/plak version")
  end
end
