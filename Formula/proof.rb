class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260804102324"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804102324/proof_0.1.0-main.20260804102324_darwin_arm64.tar.gz"
      sha256 "7edee86622d42b25f5ac9d564a3e9c420c239b7b66cfa1e75660a2f45782e734"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804102324/proof_0.1.0-main.20260804102324_darwin_amd64.tar.gz"
      sha256 "4283454ceefbdd085a635c9b36dba85088d697a968fc09c53cc1ee240f50d866"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804102324/proof_0.1.0-main.20260804102324_linux_arm64.tar.gz"
      sha256 "f9101332ee0dacff05018477dfb8b6cca6cca728e855e4f865884bf3f88d9d03"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804102324/proof_0.1.0-main.20260804102324_linux_amd64.tar.gz"
      sha256 "6744641beb2ff91d30223f69d3db1ba69c5514e6dc665e6cabdbd99493a570cc"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260804102324", output
  end
end
