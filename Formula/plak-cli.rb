class PlakCli < Formula
  desc "Interactive Bash CLI for SSH servers, local domains, and SSH keys"
  homepage "https://github.com/plakio/plak-cli"
  url "https://github.com/plakio/plak-cli/archive/refs/tags/v0.4.87.tar.gz"
  sha256 "0ddc3b704a34b54ffb997b3b4ea0c9419dd7ec98838fb8601326856970244b99"
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
    assert_match "plak v0.4.87", shell_output("#{bin}/plak version")
  end
end
