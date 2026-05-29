class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260529103121"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260529103121/proof_0.1.0-main.20260529103121_darwin_arm64.tar.gz"
      sha256 "d0b0ef2225c3149c2e7cc91e14fb08bdc30c4b4369b2ab22418e1c564dfd2842"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260529103121/proof_0.1.0-main.20260529103121_darwin_amd64.tar.gz"
      sha256 "5592559209b6a4b5a0f078b1db68b91db6de76a601d61fe48eb73fd5db5e5e9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260529103121/proof_0.1.0-main.20260529103121_linux_arm64.tar.gz"
      sha256 "5c569f81c2898e9f7d7e6a1a68050d475b6673748507580b55fb1d98eb3f48bc"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260529103121/proof_0.1.0-main.20260529103121_linux_amd64.tar.gz"
      sha256 "8bf64bb8c096f4c984651a794f2e46d13095a1680db434bf9ed3e921abe405b4"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260529103121", output
  end
end
