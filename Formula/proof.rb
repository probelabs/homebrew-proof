class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260816105646"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816105646/proof_0.1.0-main.20260816105646_darwin_arm64.tar.gz"
      sha256 "9721ba53bdc6fa37b909666b9df5c152899f58bf16f260e83ecff374ab72998d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816105646/proof_0.1.0-main.20260816105646_darwin_amd64.tar.gz"
      sha256 "3dd02246744c664dab8acd4f019d1f0bc0d181d8422f5fdcdb5481036736531c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816105646/proof_0.1.0-main.20260816105646_linux_arm64.tar.gz"
      sha256 "7057b1ef69d3efe27d08816c45b7cde1cdd751cd6bdeb2d52b7a6e2c87fb3571"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816105646/proof_0.1.0-main.20260816105646_linux_amd64.tar.gz"
      sha256 "ac66880195b80d1abda636240915fc7afa3ed6bc346725bb0c4c03bc95182b15"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260816105646", output
  end
end
