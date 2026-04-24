class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260424143521"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424143521/proof_0.1.0-main.20260424143521_darwin_arm64.tar.gz"
      sha256 "52fd97add3b00e0d74281dc5ce07daa6a71b40dd56c60b227fdafbfc460763b5"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424143521/proof_0.1.0-main.20260424143521_darwin_amd64.tar.gz"
      sha256 "8166ffbb393d8ac67f9eb5a768c0852d8fc53d0ed9f2bed89657cd76ded658d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424143521/proof_0.1.0-main.20260424143521_linux_arm64.tar.gz"
      sha256 "b987f4d2a30859ccc918a8622b93bb3564e71a8d2c03c7b33ac43e2b56e3ff9a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424143521/proof_0.1.0-main.20260424143521_linux_amd64.tar.gz"
      sha256 "dee0dbf16f2332145b4b24fa51f16f96a095364e58a4a3bf1f99f04d22db0302"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260424143521", output
  end
end
