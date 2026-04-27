class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427181602"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427181602/proof_0.1.0-main.20260427181602_darwin_arm64.tar.gz"
      sha256 "b0630f3d81605448918561fff3e876ca4aedd2269be0893f74868fb0d8291804"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427181602/proof_0.1.0-main.20260427181602_darwin_amd64.tar.gz"
      sha256 "f9a02df50b5013dd86e8cc2107ffa5c068fea1f11d68b300088e9a5f9a5a5c4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427181602/proof_0.1.0-main.20260427181602_linux_arm64.tar.gz"
      sha256 "089d34fdc1a88cc26c2c66bfda944c1fadb68648ac4588a2faab05e0b289c57d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427181602/proof_0.1.0-main.20260427181602_linux_amd64.tar.gz"
      sha256 "746502941f7114ca7f6379dfd16a172f6d15a638eab66bb52cd1f52f92de233b"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427181602", output
  end
end
