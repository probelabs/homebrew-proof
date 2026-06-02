class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260602111216"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602111216/proof_0.1.0-main.20260602111216_darwin_arm64.tar.gz"
      sha256 "0f122053bf5c20383abfcf063c6c49485df484647697b00d1d7a6a309173c7f1"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602111216/proof_0.1.0-main.20260602111216_darwin_amd64.tar.gz"
      sha256 "fdac0fcf89dfc1c157fb4589a62d9a29423a7557d0d6f17d8afa5e279d2fbf94"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602111216/proof_0.1.0-main.20260602111216_linux_arm64.tar.gz"
      sha256 "e0d1d9c3b7224e4d032cd49a06068b4317267eb47f3c8da8b1b2566dd200ea53"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260602111216/proof_0.1.0-main.20260602111216_linux_amd64.tar.gz"
      sha256 "7b6892fc50a1bd166ce0a9012ae399eb316d55983688d4789d97201fabe4d878"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260602111216", output
  end
end
