class ProtokolCli < Formula
  desc "Command line interface for the Protokol project"
  homepage "https://github.com/laibulle/protokol"
  url "https://github.com/laibulle/protokol/archive/refs/heads/main.tar.gz"
  sha256 "8f6bbb3bf644b3bab8dd744737abc0a08af9ce6550c9cdacf9a4e3fc835e4162"
  license "MIT"
  version "0.1.0"

  depends_on "node"

  def install
    system "npm", "install"
    system "make", "cli-release"
    bin.install "ptk"
  end

  test do
    system bin/"ptk", "--help"
  end
end