class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817141657"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817141657/proof_0.1.0-main.20260817141657_darwin_arm64.tar.gz"
      sha256 "e144dd69b32b416faf1015649c93b6b5e35d0d5940eb0c0522f11edc4822e014"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817141657/proof_0.1.0-main.20260817141657_darwin_amd64.tar.gz"
      sha256 "25423014ed45100151bf630ab4f4b9303a3768b7208019b9944dfe50acdbb51f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817141657/proof_0.1.0-main.20260817141657_linux_arm64.tar.gz"
      sha256 "478052dd61f58b84a88bb6a71827027920d47b99e8c6c8f460a0250163a5f7e6"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817141657/proof_0.1.0-main.20260817141657_linux_amd64.tar.gz"
      sha256 "b4068ec6ab48fc568987742f90e26368ecbfc2000a8780e1c2566475b5dcee9e"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817141657", output
  end
end
