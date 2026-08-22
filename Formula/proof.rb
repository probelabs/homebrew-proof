class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260822052322"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822052322/proof_0.1.0-main.20260822052322_darwin_arm64.tar.gz"
      sha256 "dda6dc302ffcbdc90418dccb31b1ca31a9631ba755394f72011da424cb44e418"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822052322/proof_0.1.0-main.20260822052322_darwin_amd64.tar.gz"
      sha256 "acc3be036f31f5272b123facdc08a2a63c0d0e53851fc3e26a6c3143e9dd6c31"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822052322/proof_0.1.0-main.20260822052322_linux_arm64.tar.gz"
      sha256 "4a37f8068ddf2e720a18069bed87a0b0f80a9a6f658ca1a8891a68199ddf5570"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822052322/proof_0.1.0-main.20260822052322_linux_amd64.tar.gz"
      sha256 "baf1cffe61b93e21bfbe2a09141f70f10353132ef70e1e81e030322c9d781e7c"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260822052322", output
  end
end
