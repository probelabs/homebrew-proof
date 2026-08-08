class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260808185835"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808185835/proof_0.1.0-main.20260808185835_darwin_arm64.tar.gz"
      sha256 "f7375318d5a98f0301e77d8418e4261785cb473155d7409f2a9968084c7bda80"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808185835/proof_0.1.0-main.20260808185835_darwin_amd64.tar.gz"
      sha256 "389d86d72107bacca0d5721d5b7eb1a441e558404ee21b91b99082fc367e9ddb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808185835/proof_0.1.0-main.20260808185835_linux_arm64.tar.gz"
      sha256 "198f4feeb8aba9a2c7c1c51657742816dd0de480bcc5074410807248c27fda25"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808185835/proof_0.1.0-main.20260808185835_linux_amd64.tar.gz"
      sha256 "61283a8151cf266702bbe1aae986ef1aa34fa83043cb23f9719dacfdb4c0ab19"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260808185835", output
  end
end
