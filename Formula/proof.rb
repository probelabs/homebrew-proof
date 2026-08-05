class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260805100305"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805100305/proof_0.1.0-main.20260805100305_darwin_arm64.tar.gz"
      sha256 "15b0c6fb3252f7afefc1f772aeaee9fef3f9ed2b9c5ef35a5c09c9c331cfdcbb"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805100305/proof_0.1.0-main.20260805100305_darwin_amd64.tar.gz"
      sha256 "7fcc73539b5221489acfb0c7c30ebe16cadac20c2868151cf6b313b3ea66137b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805100305/proof_0.1.0-main.20260805100305_linux_arm64.tar.gz"
      sha256 "dc58f9747f6b6ec3d6227c0cfdbb5b44dc17f059554cbd1ea4c1243c68aa0023"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805100305/proof_0.1.0-main.20260805100305_linux_amd64.tar.gz"
      sha256 "adef51a841b8d41e82a6ec968c89e55ec0f01969d0f20d384d5628278bc80236"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260805100305", output
  end
end
