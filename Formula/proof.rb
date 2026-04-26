class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260426142513"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260426142513/proof_0.1.0-main.20260426142513_darwin_arm64.tar.gz"
      sha256 "893f31ea7aa7d39464ec612aae6c95f4996da9cff830c35a6e108ea816731a5d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260426142513/proof_0.1.0-main.20260426142513_darwin_amd64.tar.gz"
      sha256 "7d7603d37c10597e3c743812d818fd399b8ffb5d003fc5be80ac8159b8f537da"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260426142513/proof_0.1.0-main.20260426142513_linux_arm64.tar.gz"
      sha256 "fbc4578396a944dd16e4833f5ffdb1b11b21884c25a893a561ba717155ffb8b0"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260426142513/proof_0.1.0-main.20260426142513_linux_amd64.tar.gz"
      sha256 "bfc5d656b91508079d172a4f3569e4db182360d0cc354531aa0b8e841a9561af"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260426142513", output
  end
end
