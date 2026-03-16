require "language/node"

class ProtokolCli < Formula
  desc "Command line interface for the Protocol project"
  homepage "https://github.com/laibulle/protocol"
  # Replace 'v1.0.0' with your actual latest tag
  url "https://github.com/laibulle/protocol/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "MIT"

  depends_on "node"

  def install
    # Installs the app and its dependencies into a private location (libexec)
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    
    # Creates a symlink in /usr/local/bin (or equivalent) to your executable
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # Basic check to see if the help command works
    system "#{bin}/protokol-cli", "--help"
  end
end