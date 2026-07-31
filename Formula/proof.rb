class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260731130328"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731130328/proof_0.1.0-main.20260731130328_darwin_arm64.tar.gz"
      sha256 "a95d574846802ff907f488b056f959360fc7c67f8514ebe35f5d3d8f556a7078"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731130328/proof_0.1.0-main.20260731130328_darwin_amd64.tar.gz"
      sha256 "db63fcf0deacc21582446554e1bc24f8d1de676ad0c50960a0f2e816e0cd460c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731130328/proof_0.1.0-main.20260731130328_linux_arm64.tar.gz"
      sha256 "cabbf1fed66c1c5c0d1c48844f4a52221535cdc0805d0da0b45f35ba0614b993"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260731130328/proof_0.1.0-main.20260731130328_linux_amd64.tar.gz"
      sha256 "64a3da6b2b5906c2caa90cf80b864c006a88c257cdfa9b205f5fad0da21d7839"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260731130328", output
  end
end
