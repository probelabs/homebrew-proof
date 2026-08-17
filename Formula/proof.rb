class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817122918"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817122918/proof_0.1.0-main.20260817122918_darwin_arm64.tar.gz"
      sha256 "2875a0ccdab2ac6d2a07568db204bc40abe2cec42215b5189c0ca35df5746620"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817122918/proof_0.1.0-main.20260817122918_darwin_amd64.tar.gz"
      sha256 "e9c2bdc8462cf05859c40c9c7a1297e356b1009d826fdf3754ad3942dd12b8ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817122918/proof_0.1.0-main.20260817122918_linux_arm64.tar.gz"
      sha256 "72eeda106c58245e5d97882817ec1dc128a8edf53e46eacca60556f2e45cd664"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817122918/proof_0.1.0-main.20260817122918_linux_amd64.tar.gz"
      sha256 "eca787b1d9845a851dc2ae1e51b51686e1f73ee060c1a08a82fd46f91ea3f5d7"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817122918", output
  end
end
