class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260819131623"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260819131623/proof_0.1.0-main.20260819131623_darwin_arm64.tar.gz"
      sha256 "eef1d312dbae12be6a8c946ed7f2c900d4746ca6882b6903c05eee35977211b5"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260819131623/proof_0.1.0-main.20260819131623_darwin_amd64.tar.gz"
      sha256 "13af855ac27a191f72b84d6897486b78f77bf1871c76e2870060cb624fbac2eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260819131623/proof_0.1.0-main.20260819131623_linux_arm64.tar.gz"
      sha256 "5cf0ae44953e6f7f90f0428e0f7e598d665566c752b15de1c02a3c5a1da32fdc"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260819131623/proof_0.1.0-main.20260819131623_linux_amd64.tar.gz"
      sha256 "6692b5264965097fee40be16d120faa7e370aa8157ccb380f3f328dbadbf8605"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260819131623", output
  end
end
