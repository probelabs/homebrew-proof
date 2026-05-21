class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260521183426"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260521183426/proof_0.1.0-main.20260521183426_darwin_arm64.tar.gz"
      sha256 "717a3eefd3c1192aef85b519cc1eb8a0ddd9ac9299b0350c197709e0d032e32d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260521183426/proof_0.1.0-main.20260521183426_darwin_amd64.tar.gz"
      sha256 "9109751b911ddbb88b4b55e8869cc7b6b3c2d22e2a32f54e1cc5ee7159575d7f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260521183426/proof_0.1.0-main.20260521183426_linux_arm64.tar.gz"
      sha256 "22a021d0efc348f477728378609d0302266c2f4a2ebc3b6974bed6fbc5153f88"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260521183426/proof_0.1.0-main.20260521183426_linux_amd64.tar.gz"
      sha256 "b59d030c6e508cfc5ce93a873428a2901492538ab60da989e3a036f14c3975e5"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260521183426", output
  end
end
