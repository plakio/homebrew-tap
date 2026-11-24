class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.95.tar.gz"
  sha256 "a220685ee0f337b0d08df6c94fb2d30f830f4bc7555b7be57b576a75db0dfa6a"
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
    assert_match "plak v0.4.95", shell_output("#{bin}/plak version")
  end
end
