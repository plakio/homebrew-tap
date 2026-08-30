class WpMcpCli < Formula
  desc "Bash + gum CLI for the WP-MCP WordPress plugin"
  homepage "https://github.com/plakio/wp-mcp-cli"
  url "https://github.com/plakio/wp-mcp-cli/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "c3fa2d397eb3f09b958b74c7f31ad2134a5f6a02c97a26be92c87d8e03ce39b5"
  license "AGPL-3.0-or-later"

  depends_on "gum"
  depends_on "jq"

  def install
    bin.install "wp-mcp.sh" => "wp-mcp"
  end

  test do
    assert_match "wp-mcp v0.1.4", shell_output("#{bin}/wp-mcp version")
  end
end
