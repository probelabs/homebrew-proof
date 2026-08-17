class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817114030"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817114030/proof_0.1.0-main.20260817114030_darwin_arm64.tar.gz"
      sha256 "1a42195643f1c113a3edeed1186fafa05c62fbc803767eae28b8689994f4f558"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817114030/proof_0.1.0-main.20260817114030_darwin_amd64.tar.gz"
      sha256 "e8bb90f885bd4852f96840a8937d72292e7ea3acfdeefdd6806f7ec898a01a2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817114030/proof_0.1.0-main.20260817114030_linux_arm64.tar.gz"
      sha256 "aa70aec7c254fb487b3494abda878bc810919c78bef4594f708f05f9c5f27e22"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817114030/proof_0.1.0-main.20260817114030_linux_amd64.tar.gz"
      sha256 "453698aa564d0e8731d5017502d6eccbccd383e47ee996fed0620e18c418d351"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817114030", output
  end
end
