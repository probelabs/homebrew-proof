class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260821204932"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821204932/proof_0.1.0-main.20260821204932_darwin_arm64.tar.gz"
      sha256 "d08a42df742394cbf691a268629455087c3f64f95db468ff06d0e86db4109553"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821204932/proof_0.1.0-main.20260821204932_darwin_amd64.tar.gz"
      sha256 "35456225fb3d04775eacbcfa1b4133a2ce9ac39745b81575eea82d8dd5ebbbbd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821204932/proof_0.1.0-main.20260821204932_linux_arm64.tar.gz"
      sha256 "e35171039d19fc708c5edb68064ce6c983857f860723b167250463741ac7c0c0"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821204932/proof_0.1.0-main.20260821204932_linux_amd64.tar.gz"
      sha256 "491bc586fd370cd3a75cac9277d7d462f7d7027b4b9f93e4f5f0a275f4b33cc1"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260821204932", output
  end
end
