class ProtokolCli < Formula
  desc "Command line interface for the Protokol project"
  homepage "https://github.com/laibulle/protokol"
  url "https://github.com/laibulle/protokol/archive/refs/heads/main.tar.gz"
  sha256 "8a97e8740ead071e25009d54d66f339ffebeb4ff3ee185d70962b729f1bbfa31"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install"
    system "npx", "turbo", "build", "--filter=@protokol/cli"

    cd "apps/cli" do
      system "npm", "pack"
      system "npm", "install", "-g", "--prefix", libexec, "protokol-cli-#{version}.tgz"
    end

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"protokol", "--help"
  end
end