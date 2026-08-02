class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260802151108"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260802151108/proof_0.1.0-main.20260802151108_darwin_arm64.tar.gz"
      sha256 "f83a72a52c08119861368c367b4f37585b7e590291065ea54d21ac0412086e78"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260802151108/proof_0.1.0-main.20260802151108_darwin_amd64.tar.gz"
      sha256 "24eee2dc873ebca9a721e5c9c3b1fd752f5e5e413d1877c17bf7bdcdd4a002dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260802151108/proof_0.1.0-main.20260802151108_linux_arm64.tar.gz"
      sha256 "97015585321212cb934996ae2a8523119982884779f90e976d7939df047b351e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260802151108/proof_0.1.0-main.20260802151108_linux_amd64.tar.gz"
      sha256 "1375158921c9fc20344d3b6d26fe701a6da2b9253b572bf19cbb789dad8428c0"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260802151108", output
  end
end
