class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260602150710"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602150710/proof_0.1.0-main.20260602150710_darwin_arm64.tar.gz"
      sha256 "3b63b762867d5d24d6d9b5586d39e859f4e9a8d4128037fceb0b77f8e0923b53"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602150710/proof_0.1.0-main.20260602150710_darwin_amd64.tar.gz"
      sha256 "34686109d407e05d9783a20c9c76db00c67f9d5e3308fc02ccb992b5c2a0060b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602150710/proof_0.1.0-main.20260602150710_linux_arm64.tar.gz"
      sha256 "6caf6ed7c68ce2f64512762e269a3d84d5b387670d5a6ea2c18571291ba44cba"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602150710/proof_0.1.0-main.20260602150710_linux_amd64.tar.gz"
      sha256 "25604a8554500536834fcf97da3c4ae9b08eeb758e587074d11fbfb6cb256f0e"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260602150710", output
  end
end
