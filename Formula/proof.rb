class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427130011"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427130011/proof_0.1.0-main.20260427130011_darwin_arm64.tar.gz"
      sha256 "f02581760e5c8adbd1d1cd67628f3bf9ae72fd3929e280aca6da2ae46a87663a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427130011/proof_0.1.0-main.20260427130011_darwin_amd64.tar.gz"
      sha256 "8dc10c874484ef8dabca5c8c87c3dbf1ae7d55a22651457bbf7e65eb9956e8a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427130011/proof_0.1.0-main.20260427130011_linux_arm64.tar.gz"
      sha256 "452ee29a4c5472b00befcb576af596028bf0399c89a2dd8e495f52eeb0ca9249"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427130011/proof_0.1.0-main.20260427130011_linux_amd64.tar.gz"
      sha256 "4bd1293734af86b6204c66e2d5f698b3d3d6a69103d15b7d384d8210c1ef940f"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427130011", output
  end
end
