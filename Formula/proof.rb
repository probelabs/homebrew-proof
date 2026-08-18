class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260818070805"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818070805/proof_0.1.0-main.20260818070805_darwin_arm64.tar.gz"
      sha256 "0f3d69ba98e4c282f7c28afed76553a2bbd167cd78aab4a69aeaa1a4f529d903"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818070805/proof_0.1.0-main.20260818070805_darwin_amd64.tar.gz"
      sha256 "b43e31e1933a4a0db2d70b79f9e4d3a8dca5b22a3b273fdbb59ee537020926b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818070805/proof_0.1.0-main.20260818070805_linux_arm64.tar.gz"
      sha256 "c3c2b1b544260a8402a2f12d146b39074deea54ccafe5df52fc4082b1e6506f4"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818070805/proof_0.1.0-main.20260818070805_linux_amd64.tar.gz"
      sha256 "14fafba4ef3832c71dba2086347568d365d552e93c4b286b1f77580ee5d7db1a"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260818070805", output
  end
end
