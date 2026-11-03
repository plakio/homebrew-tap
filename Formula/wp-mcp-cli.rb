class WpMcpCli < Formula
  desc "Bash + gum CLI for the WP-MCP WordPress plugin"
  homepage "https://github.com/plakio/wp-mcp-cli"
  url "https://github.com/plakio/wp-mcp-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "686ca3c86d196053d87e60aad87c73febcb490ecb7650b780031a4dd5310069d"
  license "AGPL-3.0-or-later"

  depends_on "gum"
  depends_on "jq"

  def install
    bin.install "wp-mcp.sh" => "wp-mcp"
  end

  test do
    assert_match "wp-mcp v0.2.0", shell_output("#{bin}/wp-mcp version")
  end
end
