class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260812160620"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812160620/proof_0.1.0-main.20260812160620_darwin_arm64.tar.gz"
      sha256 "09826015899e251271f8059024e9dcd8eeedaecc88cde962d0f643ed639b0d22"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812160620/proof_0.1.0-main.20260812160620_darwin_amd64.tar.gz"
      sha256 "304431270ab933d8eb03c52de1d87981d6c2ebf7d5f187df2afe4aef2b6a6335"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812160620/proof_0.1.0-main.20260812160620_linux_arm64.tar.gz"
      sha256 "68cf0fc599cb65922ebe078de15fea85f0a1089fab2f819cf236835ecf737cea"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812160620/proof_0.1.0-main.20260812160620_linux_amd64.tar.gz"
      sha256 "83df43b202a3485af5f75f9d90e2a7a064c9485f068d89b985f6b72be079f2e8"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260812160620", output
  end
end
