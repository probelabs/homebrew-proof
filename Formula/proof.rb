class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260519133345"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519133345/proof_0.1.0-main.20260519133345_darwin_arm64.tar.gz"
      sha256 "00e50dc2bd3d095ecf7223f2158af8bd573d20b1017332bfa874846337b0afd1"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519133345/proof_0.1.0-main.20260519133345_darwin_amd64.tar.gz"
      sha256 "dc9304f529cf584642ce648662a7e4c98bb94d18e7ea67cf2b48e8baedfb07be"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519133345/proof_0.1.0-main.20260519133345_linux_arm64.tar.gz"
      sha256 "f1ec251b7f7488b68678f7f1340f30fb0271d9d34fd6ab878fe7f4e5070d7040"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519133345/proof_0.1.0-main.20260519133345_linux_amd64.tar.gz"
      sha256 "0d6fe8dd3ccd990988f5ef7ff37d8a05f25ba26c6f772e9b62ac6f851b1dbe54"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260519133345", output
  end
end
