class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260803152846"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803152846/proof_0.1.0-main.20260803152846_darwin_arm64.tar.gz"
      sha256 "589a5c3926d064c4411b02d4257d01349ff91edeffdf2aecda83f8c3604cab10"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803152846/proof_0.1.0-main.20260803152846_darwin_amd64.tar.gz"
      sha256 "2ef4cef80fe3dcba947ebbf055edb5811a08f0504364a6a9d446503dba9c6748"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803152846/proof_0.1.0-main.20260803152846_linux_arm64.tar.gz"
      sha256 "8c82e3cc2ae900bc235a0e9fff56bceca005cf7c88487d3f2e2e78a54c859ef7"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803152846/proof_0.1.0-main.20260803152846_linux_amd64.tar.gz"
      sha256 "fdaff60f67742533c315dd199dfce7389be7b321d17fc7c1758622200a594a1d"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260803152846", output
  end
end
