class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260804200629"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804200629/proof_0.1.0-main.20260804200629_darwin_arm64.tar.gz"
      sha256 "cb48156be6d0e4cabab40662f15f70558ea92238b37f06b5266ee9569e1d2359"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804200629/proof_0.1.0-main.20260804200629_darwin_amd64.tar.gz"
      sha256 "f0caacfb8b8155a9def82d2fca419b516a9ba5eb1694830ab468f05e9e3c4afe"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804200629/proof_0.1.0-main.20260804200629_linux_arm64.tar.gz"
      sha256 "de43868a8fc23e4d6323b0010625a1c44d47d63f19f1574bab5965b465deb93a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804200629/proof_0.1.0-main.20260804200629_linux_amd64.tar.gz"
      sha256 "4bc5f71983da338525d7f32f7a5780bc3b8d3c80ca0079a6145fcb5e46cd9dad"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260804200629", output
  end
end
