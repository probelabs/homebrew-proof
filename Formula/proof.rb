class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427111325"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427111325/proof_0.1.0-main.20260427111325_darwin_arm64.tar.gz"
      sha256 "318d37430269943387554ca8cc6b8f8548bf0b17bf33a53e185923ede6fd63e6"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427111325/proof_0.1.0-main.20260427111325_darwin_amd64.tar.gz"
      sha256 "6659f7b68e5bc646598460708d4205e37083dce2466098c1bbdfa17be12e962d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427111325/proof_0.1.0-main.20260427111325_linux_arm64.tar.gz"
      sha256 "4ac08f6f4b347dbc856e81483485fa272df7fd5d67ff3b0e0ac73cfde2f8c907"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427111325/proof_0.1.0-main.20260427111325_linux_amd64.tar.gz"
      sha256 "a91f0da34b8553c1a405d47f61b77e28f03219d3b0a6c00fbcb1386fa9b21feb"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427111325", output
  end
end
