class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260807163513"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260807163513/proof_0.1.0-main.20260807163513_darwin_arm64.tar.gz"
      sha256 "10cda30d0cf5e2f330606a4d535913fc05e4761552c9cf34a274086af689ffc7"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260807163513/proof_0.1.0-main.20260807163513_darwin_amd64.tar.gz"
      sha256 "33d7adf46f3339c5f3081b78dbdcfe9e9ae55c3ab9dbc43d74800e2de9ba9db9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260807163513/proof_0.1.0-main.20260807163513_linux_arm64.tar.gz"
      sha256 "42d3f0d92832f20759838fc6c99a0884613d677f32c00cc5e896b6ac69807f9a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260807163513/proof_0.1.0-main.20260807163513_linux_amd64.tar.gz"
      sha256 "010bf3042a5a3ad6925957d63ad49f5411f5f34088fbd1884d352ad93eb18517"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260807163513", output
  end
end
