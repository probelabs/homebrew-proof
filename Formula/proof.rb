class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427175148"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427175148/proof_0.1.0-main.20260427175148_darwin_arm64.tar.gz"
      sha256 "5ddde86df9fc2aa9e2c21f9c5c2396e219472c38745a2663e661c15f7c0539e6"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427175148/proof_0.1.0-main.20260427175148_darwin_amd64.tar.gz"
      sha256 "65322381ae6a9defc8541113a1fe1a64c276cbf4ff8e03f4642ad46be5fea2d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427175148/proof_0.1.0-main.20260427175148_linux_arm64.tar.gz"
      sha256 "13e5fdd83291c418be15ab6b375d51fbdc0c0e1506b89058c96ef5f558498f5f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427175148/proof_0.1.0-main.20260427175148_linux_amd64.tar.gz"
      sha256 "dbfb5de1f16e823dd23419052c696d6b91497b752b59380f664b516c2a683609"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427175148", output
  end
end
