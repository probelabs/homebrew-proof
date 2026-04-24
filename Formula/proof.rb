class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260424194113"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424194113/proof_0.1.0-main.20260424194113_darwin_arm64.tar.gz"
      sha256 "f7b013844fe931a90d58c3783ccfcdc048976ef5a96be07761e0be472991fa5a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424194113/proof_0.1.0-main.20260424194113_darwin_amd64.tar.gz"
      sha256 "a78ce435ae945f0dd017fa6a76eba39d39bb149cac449f1c4225a04ad403971a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424194113/proof_0.1.0-main.20260424194113_linux_arm64.tar.gz"
      sha256 "dff08b78979db5c25e61bcadfd8ce3ca9360e6f960b9b77a2a0efbaa24f4d4a1"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424194113/proof_0.1.0-main.20260424194113_linux_amd64.tar.gz"
      sha256 "3cfeba46d2d75ae2cc97a1894679943d87c0315daa3a346fa80d0cb5adea0f6f"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260424194113", output
  end
end
