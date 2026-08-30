class WpMcpCli < Formula
  desc "Bash + gum CLI for the WP-MCP WordPress plugin"
  homepage "https://github.com/plakio/wp-mcp-cli"
  url "https://github.com/plakio/wp-mcp-cli/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "d1870f40206e156a528fe04fb906f2a5924d872c114bcb0183824de6f39caa0c"
  license "AGPL-3.0-or-later"

  depends_on "gum"
  depends_on "jq"

  def install
    bin.install "wp-mcp.sh" => "wp-mcp"
  end

  test do
    assert_match "wp-mcp v0.1.3", shell_output("#{bin}/wp-mcp version")
  end
end
