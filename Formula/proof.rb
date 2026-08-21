class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260821214335"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821214335/proof_0.1.0-main.20260821214335_darwin_arm64.tar.gz"
      sha256 "5837aacd1a97fad10e65a97625b32f8e26b43f20442a632eecbbe6a5eef02d5c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821214335/proof_0.1.0-main.20260821214335_darwin_amd64.tar.gz"
      sha256 "eaf46fe18dfa4d8ed9895af94f417d9be8e3cbcb45b612461c927dc1ba2e0054"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821214335/proof_0.1.0-main.20260821214335_linux_arm64.tar.gz"
      sha256 "de8034525aead1496413efe057dedea09bd4d44115285a4976f8c907dc6cfa64"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821214335/proof_0.1.0-main.20260821214335_linux_amd64.tar.gz"
      sha256 "8f3ae5d2748e0feeed5d50174ab4c1b0daaf492f955e4981b9c89971a2636afb"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260821214335", output
  end
end
