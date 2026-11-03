class WpMcpCli < Formula
  desc "Bash + gum CLI for the WP-MCP WordPress plugin"
  homepage "https://github.com/plakio/wp-mcp-cli"
  url "https://github.com/plakio/wp-mcp-cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "63b624aa3794b1be90bbd5d3e684578543850c5f1d2019fe077e316f7d55b988"
  license "AGPL-3.0-or-later"

  depends_on "gum"
  depends_on "jq"

  def install
    bin.install "wp-mcp.sh" => "wp-mcp"
  end

  test do
    assert_match "wp-mcp v0.3.0", shell_output("#{bin}/wp-mcp version")
  end
end
