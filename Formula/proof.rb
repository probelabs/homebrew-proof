class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260818081917"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818081917/proof_0.1.0-main.20260818081917_darwin_arm64.tar.gz"
      sha256 "58372a2072bf2be68b3f1a0d6ff38c41eda41400804dbbf293b7e9d30b6e4035"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818081917/proof_0.1.0-main.20260818081917_darwin_amd64.tar.gz"
      sha256 "24aae92ebb073e14e8e58ca2f252ae7b8a65d99c2417822905505c9e8c536238"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818081917/proof_0.1.0-main.20260818081917_linux_arm64.tar.gz"
      sha256 "9c733bce6f1e044a75a59b52a8139d43ff9df2caae3c24c564524eab121e5a37"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818081917/proof_0.1.0-main.20260818081917_linux_amd64.tar.gz"
      sha256 "04d57ca4cc5e0b68193813a7c2593413e68c46da008cc64e218943f2a10831c1"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260818081917", output
  end
end
