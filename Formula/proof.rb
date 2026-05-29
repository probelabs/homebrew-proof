class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260529211027"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260529211027/proof_0.1.0-main.20260529211027_darwin_arm64.tar.gz"
      sha256 "5f39586f4c9f5d9b29e1eeb0d64282c3934fee17f4143700fadc91c48f341a79"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260529211027/proof_0.1.0-main.20260529211027_darwin_amd64.tar.gz"
      sha256 "cd60181606cc7517b3684698852a4f1eef7f5cac44cda5f420a731537b92e3cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260529211027/proof_0.1.0-main.20260529211027_linux_arm64.tar.gz"
      sha256 "73ee523b86ba0eb82e275a42dc1357f87f7d639fe2ea90a8e532b50ad382e5c4"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260529211027/proof_0.1.0-main.20260529211027_linux_amd64.tar.gz"
      sha256 "4b2cef41ed5a20597be8e0f5a5cb98952377527b1441c848f62423bc34f945f3"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260529211027", output
  end
end
