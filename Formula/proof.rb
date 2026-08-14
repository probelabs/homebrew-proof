class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260814113846"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814113846/proof_0.1.0-main.20260814113846_darwin_arm64.tar.gz"
      sha256 "34b4f056fa7fe095f4b67a3b1ab418117aabf68c80ac368d32c9cefd1ac6e0f9"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814113846/proof_0.1.0-main.20260814113846_darwin_amd64.tar.gz"
      sha256 "381ad2c1941fc32aae4712aa15b667eded2b47e37a8873296a46f4f75229be2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814113846/proof_0.1.0-main.20260814113846_linux_arm64.tar.gz"
      sha256 "14647d5097cbf67e29837f4ae8c0dcf0b1622c3d8cf97008a9cbe50c22ecb9b6"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814113846/proof_0.1.0-main.20260814113846_linux_amd64.tar.gz"
      sha256 "ab6b4d2ae934815cf148625de59515b366ce89883ef348db2bf7e00f441342e5"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260814113846", output
  end
end
