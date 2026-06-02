class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260602061822"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602061822/proof_0.1.0-main.20260602061822_darwin_arm64.tar.gz"
      sha256 "e6c9694150e49bd25dd2c27cdfdfdc1c32f596a28aefe6b9d948f3c1aaf98e97"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602061822/proof_0.1.0-main.20260602061822_darwin_amd64.tar.gz"
      sha256 "1dce38863406aa063974a629a26bd9998e647535fe58fb433f5d0163c06ad521"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602061822/proof_0.1.0-main.20260602061822_linux_arm64.tar.gz"
      sha256 "9b9afb9c8bc3acbdc580c98bdfd56d922e84660f7071c12e072b411affa5184e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602061822/proof_0.1.0-main.20260602061822_linux_amd64.tar.gz"
      sha256 "6a2812eda1b25a8c56b540caaa803e9c0ac3df33f1ab4f30254efac56f3d8fef"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260602061822", output
  end
end
