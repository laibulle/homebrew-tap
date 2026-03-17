class ProtokolCli < Formula
  desc "Command line interface for the Protokol project"
  homepage "https://github.com/laibulle/protokol"
  url "https://github.com/laibulle/protokol/archive/refs/heads/main.tar.gz"
  sha256 "8a97e8740ead071e25009d54d66f339ffebeb4ff3ee185d70962b729f1bbfa31"
  license "MIT"
  version "0.1.0"

  depends_on "node"

  def install
    system "npm", "install"
    system "npx", "turbo", "build", "--filter=@protokol/cli"

    # Re-bundle with all dependencies inlined into a single file
    system "npx", "esbuild", "apps/cli/dist/index.js",
           "--bundle", "--platform=node", "--format=esm",
           "--outfile=#{libexec}/protokol.js"

    (bin/"protokol").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/protokol.js" "$@"
    SH
  end

  test do
    system bin/"protokol", "--help"
  end
end