class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260808171924"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808171924/proof_0.1.0-main.20260808171924_darwin_arm64.tar.gz"
      sha256 "d8a416ad6577a073bfd46b579fbcee9b275629632c3e01813ba911bb00723057"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808171924/proof_0.1.0-main.20260808171924_darwin_amd64.tar.gz"
      sha256 "f06fff3ad0043c78a8b1a1e97deec16f4a184755fd37be6d5446e7db536daef1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808171924/proof_0.1.0-main.20260808171924_linux_arm64.tar.gz"
      sha256 "e4fc7476c3872a2ec868681925276d50a3619ee88c05c058b5e9ef1d5c573aef"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808171924/proof_0.1.0-main.20260808171924_linux_amd64.tar.gz"
      sha256 "bdee3ab74dae25001b50e7baf70620f0922bdf45ac30a77e661704dc10eba9c3"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260808171924", output
  end
end
