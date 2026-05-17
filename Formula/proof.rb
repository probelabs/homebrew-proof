class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260517080030"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260517080030/proof_0.1.0-main.20260517080030_darwin_arm64.tar.gz"
      sha256 "8044784c942647446e1071444cf11378abea0773d951bed673e5534e0f2fb908"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260517080030/proof_0.1.0-main.20260517080030_darwin_amd64.tar.gz"
      sha256 "46d6ba8513e74406f29242a0da2410b6e76c2208e0853ea669cef56694a02849"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260517080030/proof_0.1.0-main.20260517080030_linux_arm64.tar.gz"
      sha256 "b50b238b013ee1c51b4e280806f8dc3953fd9f3d2334818eadfcd83180c83627"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260517080030/proof_0.1.0-main.20260517080030_linux_amd64.tar.gz"
      sha256 "cbc292b16a7fbd207d30985c7d3e0c9311cd53acc3b5ee5a3840ea11e622fe59"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260517080030", output
  end
end
