class WpMcpCli < Formula
  desc "Bash + gum CLI for the WP-MCP WordPress plugin"
  homepage "https://github.com/plakio/wp-mcp-cli"
  url "https://github.com/plakio/wp-mcp-cli/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "8f5348bdacd6d7d1d3bab0138b8558c30e960d63e1e55cf5ebc9e4a6945b501d"
  license "AGPL-3.0-or-later"

  depends_on "gum"
  depends_on "jq"

  def install
    bin.install "wp-mcp.sh" => "wp-mcp"
  end

  test do
    assert_match "wp-mcp v0.1.6", shell_output("#{bin}/wp-mcp version")
  end
end
