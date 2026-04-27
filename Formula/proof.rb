class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427223138"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427223138/proof_0.1.0-main.20260427223138_darwin_arm64.tar.gz"
      sha256 "711d6df85888327b3991f12ae0bcff8bc2ad24eb887f8ed7c0706f455bc6fa9e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427223138/proof_0.1.0-main.20260427223138_darwin_amd64.tar.gz"
      sha256 "0b5944d8d3b7cd61bfda77e753fe11221f3bb0640c161f184aa8e83d5817aa37"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427223138/proof_0.1.0-main.20260427223138_linux_arm64.tar.gz"
      sha256 "739e41116ad1960968c1c0b388ee5e10f0b1dd4eff505631581a0a1cea0af561"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427223138/proof_0.1.0-main.20260427223138_linux_amd64.tar.gz"
      sha256 "e0b125dd2d28def2dd4df51feb7e4afd6cea7a494132643ca86c57da9c49db3c"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427223138", output
  end
end
