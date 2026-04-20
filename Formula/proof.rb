class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260420054827"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260420054827/proof_0.1.0-main.20260420054827_darwin_arm64.tar.gz"
      sha256 "1f8d049c28d517b4d179d0d73ce0d4c6a22f9004e935b13a90f699ff236a1b33"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260420054827/proof_0.1.0-main.20260420054827_darwin_amd64.tar.gz"
      sha256 "316de9e053b84870d7f4b3106927c3d2a0d5672f1f2e11a5c7cce20281cf0b2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260420054827/proof_0.1.0-main.20260420054827_linux_arm64.tar.gz"
      sha256 "d0f60c8aafe857e024b83eb77bafb71eaba093cbaa25e666272a44ff7183746a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260420054827/proof_0.1.0-main.20260420054827_linux_amd64.tar.gz"
      sha256 "758634fc0b216107558867b5c74aef95d9073284287989369f7499acad6b8305"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260420054827", output
  end
end
