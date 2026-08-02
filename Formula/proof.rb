class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260802185851"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260802185851/proof_0.1.0-main.20260802185851_darwin_arm64.tar.gz"
      sha256 "2085b941cf63c020f6153d44937bd3391a0550f111c875ea06ff91236b248991"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260802185851/proof_0.1.0-main.20260802185851_darwin_amd64.tar.gz"
      sha256 "fc6ce860767168ebd8f2bb21da17b180c7c322a68b805b829a60beca2bfb3b3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260802185851/proof_0.1.0-main.20260802185851_linux_arm64.tar.gz"
      sha256 "f6b19a28b592825820a8630a151826eeb2f7d1d299cbc1ebdf26b128e0f7e82e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260802185851/proof_0.1.0-main.20260802185851_linux_amd64.tar.gz"
      sha256 "bff836cb7e95f5794e311948fa7a10de6df5e00828a6ec2e89108f50924c74f4"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260802185851", output
  end
end
