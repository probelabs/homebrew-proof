class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260808201706"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808201706/proof_0.1.0-main.20260808201706_darwin_arm64.tar.gz"
      sha256 "c048414b6cbc01be2452f89894f03a461cb075ff2642c1673bc90f42378bc4db"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808201706/proof_0.1.0-main.20260808201706_darwin_amd64.tar.gz"
      sha256 "4f8841c41cfb8c5e554ebf225463de0aefc518045a386ff9861a5e629f279298"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808201706/proof_0.1.0-main.20260808201706_linux_arm64.tar.gz"
      sha256 "8bce1fc632450e3e89376734d3f81a95b9b5f8abbbc21a8a830d88b35809f77c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808201706/proof_0.1.0-main.20260808201706_linux_amd64.tar.gz"
      sha256 "042687243300b41d5da87f6baf30c322b41a757e3c2acff4546d2f41dad093dd"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260808201706", output
  end
end
