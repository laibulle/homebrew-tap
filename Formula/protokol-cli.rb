class ProtokolCli < Formula
  desc "Command line interface for the Protokol project"
  homepage "https://github.com/laibulle/protokol"
  url "https://github.com/laibulle/protokol/archive/refs/heads/main.tar.gz"
  sha256 "055638306ded3dcbcb6e67c832095eafa7a20d56b79a63438adff96bd662450a"
  license "MIT"
  version "0.1.0"

  depends_on "node"

  def install
    system "npm", "install"
    system "make", "cli-release"
    bin.install "ptk"
  end

  service do
    run [bin/"ptk", "wallpaper"]
    run_type :interval
    interval 3600
    log_path var/"log/protokol-cli.log"
    error_log_path var/"log/protokol-cli.err"
  end

  test do
    system bin/"ptk", "--help"
  end
end