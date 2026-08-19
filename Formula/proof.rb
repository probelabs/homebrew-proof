class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260819111200"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260819111200/proof_0.1.0-main.20260819111200_darwin_arm64.tar.gz"
      sha256 "6e6d2af541130038553712d3dd7ea4d87f93b463ed4b6870bf705ed08d83eb09"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260819111200/proof_0.1.0-main.20260819111200_darwin_amd64.tar.gz"
      sha256 "8f33d025e1ff7594ab9cef82c58043a1d4496ba2a8aa0b41c4d491a596826ce1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260819111200/proof_0.1.0-main.20260819111200_linux_arm64.tar.gz"
      sha256 "f1b0ad1880fb7bec498ee1d55e0b056e37c12dd68fd5edc9cda5a6a2231bea9a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260819111200/proof_0.1.0-main.20260819111200_linux_amd64.tar.gz"
      sha256 "d207d2a54f678c47ef0e5e3f9e630b6a092348018b0ea32e461d7ad6f394a194"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260819111200", output
  end
end
