class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260421202544"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260421202544/proof_0.1.0-main.20260421202544_darwin_arm64.tar.gz"
      sha256 "ea6d4ac0e87ffdd5c8ee36fe5cafac1d3cf3e052c53c89b6108ea4ed0aafae33"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260421202544/proof_0.1.0-main.20260421202544_darwin_amd64.tar.gz"
      sha256 "014600353f54e0a83fee78e13561d2f50a6e432dbf2a40250361e8adc0cc6677"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260421202544/proof_0.1.0-main.20260421202544_linux_arm64.tar.gz"
      sha256 "179c78d0be57690b9cc22d5a1a8c31253da7c3f2b91c89c697b9f6f8b7e25674"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260421202544/proof_0.1.0-main.20260421202544_linux_amd64.tar.gz"
      sha256 "1e95f19c4e797764aa4ca6d2cddaf72b05b41bff8d344c6a47d9e100495d1ceb"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260421202544", output
  end
end
