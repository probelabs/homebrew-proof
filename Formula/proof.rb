class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260529154117"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260529154117/proof_0.1.0-main.20260529154117_darwin_arm64.tar.gz"
      sha256 "aadfce9a0e2cd60e736f49b784580981b404de1dcd1dd74388963ae81894ab8f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260529154117/proof_0.1.0-main.20260529154117_darwin_amd64.tar.gz"
      sha256 "6c5c5718850787652a20e35a800e8a73f760855b64982baecb609ccfad051b22"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260529154117/proof_0.1.0-main.20260529154117_linux_arm64.tar.gz"
      sha256 "1cb8fbeb66b1c53ce7850c4f6ecde27a42fc70ab16e0b565b3d13dafcff6f66d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260529154117/proof_0.1.0-main.20260529154117_linux_amd64.tar.gz"
      sha256 "88d068aed2a61509ed2059cfd2a82ed893c262299a01c06d67875d9ad1372859"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260529154117", output
  end
end
