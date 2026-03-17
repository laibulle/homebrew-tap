class ProtokolCli < Formula
  desc "Command line interface for the Protokol project"
  homepage "https://github.com/laibulle/protokol"
  url "https://github.com/laibulle/protokol/archive/refs/heads/main.tar.gz"
  sha256 "034093d6db70614a4b7ae16e754999676863a58f1b316ebed6112b13af92411a"
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