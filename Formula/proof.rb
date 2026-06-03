class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260603162502"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260603162502/proof_0.1.0-main.20260603162502_darwin_arm64.tar.gz"
      sha256 "b20a5b0719a7845d4429f2f59522c8b2b9524bedf291049c49894cb01f4e7a26"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260603162502/proof_0.1.0-main.20260603162502_darwin_amd64.tar.gz"
      sha256 "50abe6b19ad121da757eaa27178f9a4b959b3d91925d91330a2fe7a7e7448ec3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260603162502/proof_0.1.0-main.20260603162502_linux_arm64.tar.gz"
      sha256 "300f343d33dc2fcee8d6864c5950ab1be9e533d074a96d54c90ab663724c69b4"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260603162502/proof_0.1.0-main.20260603162502_linux_amd64.tar.gz"
      sha256 "e712df09fb7ef9fb495ab54a10f7bf0f70246e770b4b1608cb8b53fc07f61748"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260603162502", output
  end
end
