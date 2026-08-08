class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260808063325"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808063325/proof_0.1.0-main.20260808063325_darwin_arm64.tar.gz"
      sha256 "8deb179405a1acbe56adfea6ce01d24aa3e466bb10fc2e577083b81fec7f7fee"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808063325/proof_0.1.0-main.20260808063325_darwin_amd64.tar.gz"
      sha256 "e23893cf645125a65afa06e56018001db802a136b44c30060dc4917fd9a24d98"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808063325/proof_0.1.0-main.20260808063325_linux_arm64.tar.gz"
      sha256 "2cb958f2c46c3d7993ff30df9c55b01764f8f94041d35bb1d2f04e0981eec33e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808063325/proof_0.1.0-main.20260808063325_linux_amd64.tar.gz"
      sha256 "8c3d53e7041ea4c8bdaf41bf95ef0d3f7f7f3bc306d1fdb4cb4fc387d0bfed79"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260808063325", output
  end
end
