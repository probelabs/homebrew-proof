class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260813101050"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260813101050/proof_0.1.0-main.20260813101050_darwin_arm64.tar.gz"
      sha256 "58daf669521cf289f324b3d541d0ea0ac91885c5150702b644d7694e57f3f53c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260813101050/proof_0.1.0-main.20260813101050_darwin_amd64.tar.gz"
      sha256 "1f8f2634f50ada96973dd58c2461f2cf57cec4415406bafe5a7c804b6976a1cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260813101050/proof_0.1.0-main.20260813101050_linux_arm64.tar.gz"
      sha256 "558b6d314a6122a0048c9daa5fd09e120a51d07bd9893d1ee765bc8efdedbb0b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260813101050/proof_0.1.0-main.20260813101050_linux_amd64.tar.gz"
      sha256 "2d823f4c53aa96400efb6887df04f95019a15f9b97f8325f4c77418b47dab4e7"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260813101050", output
  end
end
