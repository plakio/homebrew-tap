class WpMcpCli < Formula
  desc "Bash + gum CLI for the WP-MCP WordPress plugin"
  homepage "https://github.com/plakio/wp-mcp-cli"
  url "https://github.com/plakio/wp-mcp-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "a3eb474111299af840dee77e94da28a38cdf59b4b1017103287c0c8840a6778a"
  license "AGPL-3.0-or-later"

  depends_on "gum"
  depends_on "jq"

  def install
    bin.install "wp-mcp.sh" => "wp-mcp"
  end

  test do
    assert_match "wp-mcp v0.1.2", shell_output("#{bin}/wp-mcp version")
  end
end
