class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260801174637"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260801174637/proof_0.1.0-main.20260801174637_darwin_arm64.tar.gz"
      sha256 "aed638b827e02d1e856ea1a6335d0cccaf76385964d2033525d39b17db90eead"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260801174637/proof_0.1.0-main.20260801174637_darwin_amd64.tar.gz"
      sha256 "9aaa1b35fbdd4b9b368cb02f8fef8cd64a20ade20b6e00c95f6fe605ed4893c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260801174637/proof_0.1.0-main.20260801174637_linux_arm64.tar.gz"
      sha256 "623bb96ca3b2df24f3ed166c6a2c5b0c328ab5d81a6fb8fdcb3dabc1e615e4b6"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260801174637/proof_0.1.0-main.20260801174637_linux_amd64.tar.gz"
      sha256 "842f726dbda08c526cec442e7879c414c6a1d6d2cbb9929f4973e10a9c1a92de"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260801174637", output
  end
end
