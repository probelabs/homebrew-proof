class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427115505"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427115505/proof_0.1.0-main.20260427115505_darwin_arm64.tar.gz"
      sha256 "59ca2d0c2ee31c0e78d6698633a9c96c70340d1f571e5253f705ab7c58d84ad3"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427115505/proof_0.1.0-main.20260427115505_darwin_amd64.tar.gz"
      sha256 "5fe17eea16f41f213d44f208970686c6a906835e34d39d0db78d6779d81b8c2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427115505/proof_0.1.0-main.20260427115505_linux_arm64.tar.gz"
      sha256 "b37c3621200b0469e0e56bc5e9864fedbf880a3ad0fda1f607fbbfa7918f5a6b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427115505/proof_0.1.0-main.20260427115505_linux_amd64.tar.gz"
      sha256 "5fec9d787e3c14e40da2d9a103967bfb68911b4c511c2a4aa8ea0aebb47f1598"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427115505", output
  end
end
