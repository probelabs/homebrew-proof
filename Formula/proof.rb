class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260823182429"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823182429/proof_0.1.0-main.20260823182429_darwin_arm64.tar.gz"
      sha256 "561f5f612f555be24685a9534c25415d1e8686d265a4c37ad7764084d1701732"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823182429/proof_0.1.0-main.20260823182429_darwin_amd64.tar.gz"
      sha256 "003ab234d03c85f19e6852d67dfbd2560af263952df037393a4703572fc18e89"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823182429/proof_0.1.0-main.20260823182429_linux_arm64.tar.gz"
      sha256 "fb46fe2be618f0cc814ee5dd2194a050250e9485b1766b03ecfc1dd9e020233c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823182429/proof_0.1.0-main.20260823182429_linux_amd64.tar.gz"
      sha256 "b18a47f020067f356e6a9c78771ce1c41556e9e6117ff7f5a52625155785a959"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260823182429", output
  end
end
