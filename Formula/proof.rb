class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260805061253"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805061253/proof_0.1.0-main.20260805061253_darwin_arm64.tar.gz"
      sha256 "7cb920ca257628d9bbeb945a71cfafb66aa310397287973234d99e3cdcfb6070"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805061253/proof_0.1.0-main.20260805061253_darwin_amd64.tar.gz"
      sha256 "23c9cd04e9e40feeab12bb5c9a5d38b18ac44a4578f20b46f0e3759bc9778fa0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805061253/proof_0.1.0-main.20260805061253_linux_arm64.tar.gz"
      sha256 "7134b2122848d614da4cf7e3deb3a0dae9083bb91abe4538c23276e7f4748643"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805061253/proof_0.1.0-main.20260805061253_linux_amd64.tar.gz"
      sha256 "8f6e62529a5bb49cb5b0ce941e46ff227ec2f3af9425de0a71671305d97a6c64"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260805061253", output
  end
end
