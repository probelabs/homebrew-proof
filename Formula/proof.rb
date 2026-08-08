class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260808170108"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808170108/proof_0.1.0-main.20260808170108_darwin_arm64.tar.gz"
      sha256 "0be8f971d4aae69ec3efec85104ea26b7f913e045ea22fd5e1f4e3c66019cda7"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808170108/proof_0.1.0-main.20260808170108_darwin_amd64.tar.gz"
      sha256 "ece126ea9282e2cbb70e1f23e877bee5ee6d2b29eea0407cb4076f11948a08bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808170108/proof_0.1.0-main.20260808170108_linux_arm64.tar.gz"
      sha256 "3345c0a3364d1fd7c2d1b63b1701ee6bae58979ceef65b3c3201f218337d9bae"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808170108/proof_0.1.0-main.20260808170108_linux_amd64.tar.gz"
      sha256 "2b13c652ee649da5e44f6024f8c2a4070de381633e5ecbcf6679f1529938edb5"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260808170108", output
  end
end
