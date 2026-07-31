class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260731094848"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731094848/proof_0.1.0-main.20260731094848_darwin_arm64.tar.gz"
      sha256 "c0a4626392a1b2ec31296845e76298e6d76578ae0cd3a7686d32d02f743aefbd"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731094848/proof_0.1.0-main.20260731094848_darwin_amd64.tar.gz"
      sha256 "67a44564ba8c5bb7fd305834b2adaaa780e3e081ea599449843c1a6cb46d0fa1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731094848/proof_0.1.0-main.20260731094848_linux_arm64.tar.gz"
      sha256 "a905ac098b9769219455abf6d8f445d7d84cadb7a9e61db87b0185368ca85d35"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731094848/proof_0.1.0-main.20260731094848_linux_amd64.tar.gz"
      sha256 "498926d67fae963f9758798fc2facd6360912301b37cb117362fa45572f230b9"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260731094848", output
  end
end
