class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260805103439"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805103439/proof_0.1.0-main.20260805103439_darwin_arm64.tar.gz"
      sha256 "733da2daf7c12e49e4956a7e2b7f2b3d3687824ba03e9ff6a3933661bff189ec"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805103439/proof_0.1.0-main.20260805103439_darwin_amd64.tar.gz"
      sha256 "1953f03a96e2d84cb27554c49744953172dbca1ce370849fed33691accaf1976"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805103439/proof_0.1.0-main.20260805103439_linux_arm64.tar.gz"
      sha256 "8e9f175789576434ee43f53220edaa888c83a7d673465fd3bf70a10c0bcce4ba"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805103439/proof_0.1.0-main.20260805103439_linux_amd64.tar.gz"
      sha256 "538d6728d51c483144ddbc1a1378982291717885c51279a816b88ec8bdc5cc35"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260805103439", output
  end
end
