class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427165137"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427165137/proof_0.1.0-main.20260427165137_darwin_arm64.tar.gz"
      sha256 "9a0dc220196d55418e533412b720fd813c416afe903765744b5bade080428a57"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427165137/proof_0.1.0-main.20260427165137_darwin_amd64.tar.gz"
      sha256 "bba2ad04feafcf9e392c02b61ae1249113613f472bc747064bd5d7bb521e3133"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427165137/proof_0.1.0-main.20260427165137_linux_arm64.tar.gz"
      sha256 "0015bdd34587ccdc7076d07e07ddabbe8bb6c404b7145e07ee0e4362c7d72ba8"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427165137/proof_0.1.0-main.20260427165137_linux_amd64.tar.gz"
      sha256 "2c7787bbcabdf0f42a7b651ea2e6abfe9f8bd896ca717adb6c27a0cc68fd7187"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427165137", output
  end
end
