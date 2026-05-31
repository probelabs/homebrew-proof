class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260531155709"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260531155709/proof_0.1.0-main.20260531155709_darwin_arm64.tar.gz"
      sha256 "996e80056bf34a17a6a6f34fac340dacdcb5dd5b8798a69d8c9d8e906b6e71bf"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260531155709/proof_0.1.0-main.20260531155709_darwin_amd64.tar.gz"
      sha256 "087666564d6356819fc0fd8f2feabbdfe403d4a95840f2b9f5b6996a76b7fcdd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260531155709/proof_0.1.0-main.20260531155709_linux_arm64.tar.gz"
      sha256 "6e41ca8dfc6c7b08fc3b54aaeb85cba82a849a3e1d8031a23e34c644aceeb21a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260531155709/proof_0.1.0-main.20260531155709_linux_amd64.tar.gz"
      sha256 "7499606f6e70887ec8862e02ab16f318e8734b53f220423139cf02b122e4738d"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260531155709", output
  end
end
