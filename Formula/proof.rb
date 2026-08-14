class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260814081908"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814081908/proof_0.1.0-main.20260814081908_darwin_arm64.tar.gz"
      sha256 "15727ed77a418bd756175a4b68a4e34e85bb84014c63f9c970defd1bd7b2d45a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814081908/proof_0.1.0-main.20260814081908_darwin_amd64.tar.gz"
      sha256 "48f80625d4589af31ca6350e4a9fd63fd528bd324d6fc63e2c1200c34ac3d678"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814081908/proof_0.1.0-main.20260814081908_linux_arm64.tar.gz"
      sha256 "35525bfce6a3ea69ded47c40a88e0e71ee7873bb91485f8361dd5f99e49779f3"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814081908/proof_0.1.0-main.20260814081908_linux_amd64.tar.gz"
      sha256 "4287e758eb37518017063f1f5d03b40076bda1cf346e65e7051659506103ca1d"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260814081908", output
  end
end
