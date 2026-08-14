class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260814143527"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814143527/proof_0.1.0-main.20260814143527_darwin_arm64.tar.gz"
      sha256 "473e3e1c839008fbacf03c369bc59a1f205e0b025e5c651a9dd1d14d44002823"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814143527/proof_0.1.0-main.20260814143527_darwin_amd64.tar.gz"
      sha256 "491bb171d448b9cc4eb290c5b20ba59abc0f1b46d44f68a8e7befb48192153fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814143527/proof_0.1.0-main.20260814143527_linux_arm64.tar.gz"
      sha256 "c137d1d4c9a3f1e1b90223bb35b64ffaa77bd7512277acb5c8d0c62cca10d391"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814143527/proof_0.1.0-main.20260814143527_linux_amd64.tar.gz"
      sha256 "c92c47d6499cc9175d4777f92778fa106a6302fb7e743abf1f6f2beb789cd006"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260814143527", output
  end
end
