class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260809202540"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809202540/proof_0.1.0-main.20260809202540_darwin_arm64.tar.gz"
      sha256 "a201259c1716c898599f4c2bed02d0e9472d85808982db870b8cea23641a6398"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809202540/proof_0.1.0-main.20260809202540_darwin_amd64.tar.gz"
      sha256 "03206ef70b0734f212d31f475b51963cccb2a43ec5b95f121f45b925705c3f87"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809202540/proof_0.1.0-main.20260809202540_linux_arm64.tar.gz"
      sha256 "b6f5381c3cb291563eea49fc2c962612ec85ceb9a6e449f8ab15911f3407221f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809202540/proof_0.1.0-main.20260809202540_linux_amd64.tar.gz"
      sha256 "fec47af1aba7579767d5893b0b9cf536ab4899c33a72d2b48ade9793bb561b3f"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260809202540", output
  end
end
