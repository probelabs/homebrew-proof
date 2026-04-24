class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260424185824"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424185824/proof_0.1.0-main.20260424185824_darwin_arm64.tar.gz"
      sha256 "c1fe8cb46e35f67945c448ff2525051bea1e58c5f0f0269ba7324fea264529bc"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424185824/proof_0.1.0-main.20260424185824_darwin_amd64.tar.gz"
      sha256 "170bf1ed19eb6d0d7adf1557206d492db1822d725ba59a8e14bfbae1fde72dec"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424185824/proof_0.1.0-main.20260424185824_linux_arm64.tar.gz"
      sha256 "6b7353997b2c68198ce3e9c945f5b0af2c156d598cf37bdb42dc0ebba06f70b0"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424185824/proof_0.1.0-main.20260424185824_linux_amd64.tar.gz"
      sha256 "988475132bf64bf73ff9b7729d9bf9d5bb8324133b7baaa9323dbd92de80300a"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260424185824", output
  end
end
