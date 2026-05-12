class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260512184015"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260512184015/proof_0.1.0-main.20260512184015_darwin_arm64.tar.gz"
      sha256 "d5e9fa2473941561967571229409361433e7c913bb4c60fc49920479ea9175a3"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260512184015/proof_0.1.0-main.20260512184015_darwin_amd64.tar.gz"
      sha256 "ed78751a55c08af780e5ba79e41df9b5738a4e5999a0d1c09bc69e5715bb4df7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260512184015/proof_0.1.0-main.20260512184015_linux_arm64.tar.gz"
      sha256 "6e31eaa895867e9ddff8f493daa088e675fb8584af7944319fd5052e53a4a3fb"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260512184015/proof_0.1.0-main.20260512184015_linux_amd64.tar.gz"
      sha256 "6251c86bf353eb807fbed629825025ffa777b07dbd6819aab1da58c8748f4f78"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260512184015", output
  end
end
