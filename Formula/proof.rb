class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260808060317"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808060317/proof_0.1.0-main.20260808060317_darwin_arm64.tar.gz"
      sha256 "464fee1b80ca4fc021522937ed7a4622478f46286bf48f9b7a9ab517fd01d5e5"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808060317/proof_0.1.0-main.20260808060317_darwin_amd64.tar.gz"
      sha256 "404f1d7425134b8548c7559699a95bd7569db340f70500a2cd7ed5feb68f3bbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808060317/proof_0.1.0-main.20260808060317_linux_arm64.tar.gz"
      sha256 "93dec493c5f99055394c672059223d9be0ffe2ea769d5afba3f2c015229a01c0"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808060317/proof_0.1.0-main.20260808060317_linux_amd64.tar.gz"
      sha256 "f9799627511154acebfd39a21db91e7d1a336d2589feacd04d569ed583521c70"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260808060317", output
  end
end
