class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260519160003"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519160003/proof_0.1.0-main.20260519160003_darwin_arm64.tar.gz"
      sha256 "4d6c11312f5873b60c53b68d88ae361e3a0c0c8c234c82bab81bd99f59167fe8"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519160003/proof_0.1.0-main.20260519160003_darwin_amd64.tar.gz"
      sha256 "6c51ba40fde21daf0e0679df3348a3effa3c80beeb75e325eb0347080c27ee04"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519160003/proof_0.1.0-main.20260519160003_linux_arm64.tar.gz"
      sha256 "e1c87cbbf9f4fae3b515968cfc362ebbb564f4f7adecd7cbda50b474db97d34d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519160003/proof_0.1.0-main.20260519160003_linux_amd64.tar.gz"
      sha256 "1d9bca93c08e40146e752cee9f10f2295da5858700f4cea499945c22ca4e995d"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260519160003", output
  end
end
