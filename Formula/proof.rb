class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427120308"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427120308/proof_0.1.0-main.20260427120308_darwin_arm64.tar.gz"
      sha256 "8f8907b5edf048a91fbbc5c34ab7739a1ec4e9f25faf90aa81fa785bc90e9f23"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427120308/proof_0.1.0-main.20260427120308_darwin_amd64.tar.gz"
      sha256 "fdc5e80b6042f6c2b58b46792ded41e5cbbdd15ebc1e1b85bc044c2344337a9f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427120308/proof_0.1.0-main.20260427120308_linux_arm64.tar.gz"
      sha256 "09a11007849a4371811d965e39e83296ce55a8362244e6a7048419882aadda98"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427120308/proof_0.1.0-main.20260427120308_linux_amd64.tar.gz"
      sha256 "66feae02ed21efab1108589590d96226370db31c50868e03342fce7a0cfa5273"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427120308", output
  end
end
