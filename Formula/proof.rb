class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427193210"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427193210/proof_0.1.0-main.20260427193210_darwin_arm64.tar.gz"
      sha256 "bbfb2e1e529d42a1242b0840c5ad8f3f889f8e40f96cbfedcf7c294d3774c38e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427193210/proof_0.1.0-main.20260427193210_darwin_amd64.tar.gz"
      sha256 "4dd6b4032a767b89fa872fc6fa86fc1ebc4f6f204c9c084538a1014294377aba"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427193210/proof_0.1.0-main.20260427193210_linux_arm64.tar.gz"
      sha256 "aa5fb5e1766b9ec4cf93488eb3651fc77516c4842e983501590cee808469f29e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427193210/proof_0.1.0-main.20260427193210_linux_amd64.tar.gz"
      sha256 "7c1d2d4f04243311a72f9fe4c6b430b9548c99a81cadb406ca1852b8aac275f0"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427193210", output
  end
end
