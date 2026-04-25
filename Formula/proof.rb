class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260425074443"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260425074443/proof_0.1.0-main.20260425074443_darwin_arm64.tar.gz"
      sha256 "b753cbbf13abe1619d95e440b3e4c80c851703125f698ac639307b0977a857a9"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260425074443/proof_0.1.0-main.20260425074443_darwin_amd64.tar.gz"
      sha256 "afaa852fe7a024237a6826956b40366e42c4658d5c817605f5a861991c65d1d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260425074443/proof_0.1.0-main.20260425074443_linux_arm64.tar.gz"
      sha256 "7a16e6110178debc250ee102c24856146944c43fb603396425551d6c57a87498"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260425074443/proof_0.1.0-main.20260425074443_linux_amd64.tar.gz"
      sha256 "7feeafaced0500896d2120f868c88fb796327292b40f62637a1ed9a65eef4855"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260425074443", output
  end
end
