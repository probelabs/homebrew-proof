class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260818094351"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818094351/proof_0.1.0-main.20260818094351_darwin_arm64.tar.gz"
      sha256 "e1a769594f57248bc8a6c787d5219b0bdbfe68368c1b178fecc6a0ca22fadf6e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818094351/proof_0.1.0-main.20260818094351_darwin_amd64.tar.gz"
      sha256 "10067b5f33d4c4756478b32f65c9e91fce489932afed1278faa6b018d71c14ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818094351/proof_0.1.0-main.20260818094351_linux_arm64.tar.gz"
      sha256 "be7823754aba14a7b58dc81371e68608f1f8a0c894cb2f92325997f1754f3f35"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260818094351/proof_0.1.0-main.20260818094351_linux_amd64.tar.gz"
      sha256 "e85bc1f4dd8469117cc96e2634d230403fc2e0adfb081842812fad1d0beec1d9"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260818094351", output
  end
end
