class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260429152559"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260429152559/proof_0.1.0-main.20260429152559_darwin_arm64.tar.gz"
      sha256 "d5d9a5a374e9d67f1539878e8eeb47fa6b6b671cd83bea31abdac2da4f98b5e4"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260429152559/proof_0.1.0-main.20260429152559_darwin_amd64.tar.gz"
      sha256 "8c5e41f55a7e7c9b349251fe2e6fd33cc3cfa47fee5806153c8ce0c366c94010"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260429152559/proof_0.1.0-main.20260429152559_linux_arm64.tar.gz"
      sha256 "af78d9ed0a7b08cb290b5a620bd183a5b2b44e74d2f6413718aab342dffa106c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260429152559/proof_0.1.0-main.20260429152559_linux_amd64.tar.gz"
      sha256 "00083abaeaab5460469b98ceabf98986f112e970b59402e57109c82e3f726458"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260429152559", output
  end
end
