class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260820060106"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820060106/proof_0.1.0-main.20260820060106_darwin_arm64.tar.gz"
      sha256 "2f45d7a52b0bea1f1a3ede8d4be208e057c87cbb9a6f294ff89f0e6c0132dd23"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820060106/proof_0.1.0-main.20260820060106_darwin_amd64.tar.gz"
      sha256 "7f1f34320e9e217a32fabe818e75d77e499edcc8339e692f1a5fa552316d196f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820060106/proof_0.1.0-main.20260820060106_linux_arm64.tar.gz"
      sha256 "d4c49541f2b107cca75b58202adfd790f3eccfa1686a0cf396d2ac30b9c92a28"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820060106/proof_0.1.0-main.20260820060106_linux_amd64.tar.gz"
      sha256 "3ab49f484a75db348871b104c21a1086bdfba2d7e18e71ab05c5b6da81a2a5a8"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260820060106", output
  end
end
