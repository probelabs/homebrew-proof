class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260805121237"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805121237/proof_0.1.0-main.20260805121237_darwin_arm64.tar.gz"
      sha256 "74075d643211e6a8e4d55da289819d3aba51a20290fc0302a2a1b2d3ef62ccdb"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805121237/proof_0.1.0-main.20260805121237_darwin_amd64.tar.gz"
      sha256 "5392414071e32193ee9f47291be2f40b0d741967b9aa9fa4c31425a6fc8c6249"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805121237/proof_0.1.0-main.20260805121237_linux_arm64.tar.gz"
      sha256 "6cc28ca0a9eaaacf8d40d1ed8a638a456d2b95cab2ab7625de2ac5888e4c07a3"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805121237/proof_0.1.0-main.20260805121237_linux_amd64.tar.gz"
      sha256 "a13ceafda349acc6b29f9323cc7b64f84c96476efcb25c0b1d17cdde81a65a9e"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260805121237", output
  end
end
