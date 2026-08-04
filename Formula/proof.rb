class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260804095446"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804095446/proof_0.1.0-main.20260804095446_darwin_arm64.tar.gz"
      sha256 "8e01a4a3ba72eace04bce7f7264dd3dc15b94219191aa4e6283489280253f051"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804095446/proof_0.1.0-main.20260804095446_darwin_amd64.tar.gz"
      sha256 "92d8f8b82282b2fa5d08fb8db79c69d5a6b1c2e83a8cc133bd2d97387d53654f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804095446/proof_0.1.0-main.20260804095446_linux_arm64.tar.gz"
      sha256 "6244aa34eb8ca746c208e8a77682263d7aa1c0db3e1068021ce92ebce6da2e8c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804095446/proof_0.1.0-main.20260804095446_linux_amd64.tar.gz"
      sha256 "1ba805b77ac92bf0298e5141e807ac9ea572f9a6ab376978e7467627d3898ffd"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260804095446", output
  end
end
