class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260803090952"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803090952/proof_0.1.0-main.20260803090952_darwin_arm64.tar.gz"
      sha256 "60838bd6fecbd5bb8835b1b0e4cc520b08bd51bc8ac3bf6b678113498c597765"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803090952/proof_0.1.0-main.20260803090952_darwin_amd64.tar.gz"
      sha256 "b6dec14b39dd0f2345ae508f6c585f8f2e8b4dfafe35341abf5dee6231a1bd89"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803090952/proof_0.1.0-main.20260803090952_linux_arm64.tar.gz"
      sha256 "2f4c269a247d41c0b361fe163148c483c5718d268a8632e532126bd49f1f5e3d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803090952/proof_0.1.0-main.20260803090952_linux_amd64.tar.gz"
      sha256 "0441ad5e06aadf044a8684ef305904c228f5a68a6d838918861a4535c40ef559"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260803090952", output
  end
end
