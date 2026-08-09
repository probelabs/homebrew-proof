class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260809183016"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809183016/proof_0.1.0-main.20260809183016_darwin_arm64.tar.gz"
      sha256 "10bb85191e880cff71dda470585c1f752fd7e21f05ac0ab0c6d23fb96f7f4cee"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809183016/proof_0.1.0-main.20260809183016_darwin_amd64.tar.gz"
      sha256 "aa76ed5bdcd3761553555ffe48b1ea996a9ded22184f66ac00a2460a2d69a392"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809183016/proof_0.1.0-main.20260809183016_linux_arm64.tar.gz"
      sha256 "8549430d8431af954f24bc0bca72561496e790404968c37919072cdba227d29b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809183016/proof_0.1.0-main.20260809183016_linux_amd64.tar.gz"
      sha256 "f9dc036a7969169c9b91ea58c4a42eb8a66227a8e490632dc618c1b4f2b4468f"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260809183016", output
  end
end
