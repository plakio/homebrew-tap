class WpMcpCli < Formula
  desc "Bash + gum CLI for the WP-MCP WordPress plugin"
  homepage "https://github.com/plakio/wp-mcp-cli"
  url "https://github.com/plakio/wp-mcp-cli/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "7e14da29d5c07a4881b1214c6112937c7df0670c241cf14cc1f13c8756ec2c95"
  license "AGPL-3.0-or-later"

  depends_on "gum"
  depends_on "jq"

  def install
    bin.install "wp-mcp.sh" => "wp-mcp"
  end

  test do
    assert_match "wp-mcp v0.1.9", shell_output("#{bin}/wp-mcp version")
  end
end
