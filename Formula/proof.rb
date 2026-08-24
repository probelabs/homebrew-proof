class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260824075619"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824075619/proof_0.1.0-main.20260824075619_darwin_arm64.tar.gz"
      sha256 "add49ff93965697bd58c51f16b7d2ce6d7365eae35a0b364350c8d66daedd87d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824075619/proof_0.1.0-main.20260824075619_darwin_amd64.tar.gz"
      sha256 "094dcde0cc6ded79af3e9c063cb4a412d5462b587ffc801e6cd1d00e831dc98b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824075619/proof_0.1.0-main.20260824075619_linux_arm64.tar.gz"
      sha256 "bec05f805f24a22c622d2cf5834932ab2af33597d4dfc930686cf18f4bca309e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824075619/proof_0.1.0-main.20260824075619_linux_amd64.tar.gz"
      sha256 "9eee207afaf0024adb97d17956b1200a176df5e439f02b87f93cfbfd93a15bcd"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260824075619", output
  end
end
