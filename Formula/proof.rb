class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260513174215"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260513174215/proof_0.1.0-main.20260513174215_darwin_arm64.tar.gz"
      sha256 "c2103ff1a3c6b371004024671ae7fcd337b6c2b9112cb84ab98e0c9eb5449bdb"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260513174215/proof_0.1.0-main.20260513174215_darwin_amd64.tar.gz"
      sha256 "51a9893cdc7381909617c1847ad3eaa70a22b1fa32df2db7a61acf15c48d6bf7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260513174215/proof_0.1.0-main.20260513174215_linux_arm64.tar.gz"
      sha256 "86b478d928c2544329a548589c06ca95059513dea0dae9fefd6bc17ebc65b7a0"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260513174215/proof_0.1.0-main.20260513174215_linux_amd64.tar.gz"
      sha256 "436c7a95cda6f37fab9188d4593461857559a440ca01a397832890b0ad363dd8"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260513174215", output
  end
end
