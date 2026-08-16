class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260816204740"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816204740/proof_0.1.0-main.20260816204740_darwin_arm64.tar.gz"
      sha256 "4b2954cee95d86b836e171024c788cc540c82d5e35741eddd86ab1ce02b84991"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816204740/proof_0.1.0-main.20260816204740_darwin_amd64.tar.gz"
      sha256 "5cefd199829ab1b5a13112e8bc1c60ae21b093cda5e13e1e3670caca70bda780"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816204740/proof_0.1.0-main.20260816204740_linux_arm64.tar.gz"
      sha256 "03de43c5b3ac9cfb5939a08e556e5fb6b01260293fdc477fc72da7dbc1365e96"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816204740/proof_0.1.0-main.20260816204740_linux_amd64.tar.gz"
      sha256 "4c1ab4597ff648f8ccfca03d9815b08464796f98039a91710464617f06707923"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260816204740", output
  end
end
