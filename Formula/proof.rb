class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260531125921"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260531125921/proof_0.1.0-main.20260531125921_darwin_arm64.tar.gz"
      sha256 "c1de8803b0117ffd402385334eda35cc0072344d2f714536cefbd3e5616990d3"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260531125921/proof_0.1.0-main.20260531125921_darwin_amd64.tar.gz"
      sha256 "b462af073823a6be8b58eb6ec88c5764779da01820bc38c635175624df87c86b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260531125921/proof_0.1.0-main.20260531125921_linux_arm64.tar.gz"
      sha256 "1e604e9ca9227fe27eb27b80ad0e67ebeba4b140699cd801389a31e8ec74112a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260531125921/proof_0.1.0-main.20260531125921_linux_amd64.tar.gz"
      sha256 "b585430545a684286bf71618a84420773d5fde97ad6e53d17029af4822be4748"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260531125921", output
  end
end
