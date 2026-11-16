class WpMcpCli < Formula
  desc "Bash + gum CLI for the WP-MCP WordPress plugin"
  homepage "https://github.com/plakio/wp-mcp-cli"
  url "https://github.com/plakio/wp-mcp-cli/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "dc52ee0d9ad3bfa070fd0eed864d6d3f8176234b36931991339eb8af50c687f6"
  license "AGPL-3.0-or-later"

  depends_on "gum"
  depends_on "jq"

  def install
    bin.install "wp-mcp.sh" => "wp-mcp"
  end

  test do
    assert_match "wp-mcp v0.3.1", shell_output("#{bin}/wp-mcp version")
  end
end
