class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260809211310"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809211310/proof_0.1.0-main.20260809211310_darwin_arm64.tar.gz"
      sha256 "eedfb8e861f78157f95dab4afb2ea9081d12e4b39e6515460f29371779e3260b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809211310/proof_0.1.0-main.20260809211310_darwin_amd64.tar.gz"
      sha256 "c81a6a1bf75abd6c1005e6e2ccc0e9ca8ccb1ee9e96146ab3a31bef21e3e12e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809211310/proof_0.1.0-main.20260809211310_linux_arm64.tar.gz"
      sha256 "898a18ac43759852a7de399b5866e58dbafa165b19b00099187181b6c8780e48"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809211310/proof_0.1.0-main.20260809211310_linux_amd64.tar.gz"
      sha256 "e5b6d6dcdf1538f4110994bec4a085d96099d704180c9910d33aa16fc0d8be7d"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260809211310", output
  end
end
