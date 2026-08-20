class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260820074043"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820074043/proof_0.1.0-main.20260820074043_darwin_arm64.tar.gz"
      sha256 "fb6ab0de01b97c168374de06ce61ca3a34f60336831320397611398d1e94f902"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820074043/proof_0.1.0-main.20260820074043_darwin_amd64.tar.gz"
      sha256 "2335e8f49ae9137b67cc0563eb96474ec9cc4437a61fb209cb9bf493b5c31330"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820074043/proof_0.1.0-main.20260820074043_linux_arm64.tar.gz"
      sha256 "cc10a61fd6850a4015dba77ddaccb701ad66b6cd11ff982d20b90bea1330a72f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820074043/proof_0.1.0-main.20260820074043_linux_amd64.tar.gz"
      sha256 "da068f87bbbffe96fc887dc6b6e2316a07d6778f6e7964031c7d689404518688"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260820074043", output
  end
end
