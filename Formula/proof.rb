class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260805202226"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805202226/proof_0.1.0-main.20260805202226_darwin_arm64.tar.gz"
      sha256 "ffae3f3e2047980f0c9eaf1305ae2e12b47e8358d072734a55762bd7f748c3ec"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805202226/proof_0.1.0-main.20260805202226_darwin_amd64.tar.gz"
      sha256 "6f1e4424fc24dc8398b1353e4ce24210bfda39c76f07da6c9a306a20184d42f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805202226/proof_0.1.0-main.20260805202226_linux_arm64.tar.gz"
      sha256 "60eea25dd8b6d71f506f0839edd04c795ee16f5243cbd86212c9b79db9b938fc"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805202226/proof_0.1.0-main.20260805202226_linux_amd64.tar.gz"
      sha256 "e4f07e5752f567cc9d1f5aba094921dd2568082a579a825f241b6e321ae15def"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260805202226", output
  end
end
