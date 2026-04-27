class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427171039"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427171039/proof_0.1.0-main.20260427171039_darwin_arm64.tar.gz"
      sha256 "cd09e6d99851c55d946e44132744f2cb6eaacc361e7bb7f606e646e4a9df5ca7"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427171039/proof_0.1.0-main.20260427171039_darwin_amd64.tar.gz"
      sha256 "954f5a0cc831f5a0bd2e19034df628f9a843e1eaf9ca7c59db6eeb65e7b53346"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427171039/proof_0.1.0-main.20260427171039_linux_arm64.tar.gz"
      sha256 "ea15dad25c0f517f916ec9a53a989473cedd81583682e357267387fa4292dfd6"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427171039/proof_0.1.0-main.20260427171039_linux_amd64.tar.gz"
      sha256 "a66d3edf186717ee1dc890b0344880445c23f4d49ea28a4f1188dc93bf8b72d0"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427171039", output
  end
end
