class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260428070519"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260428070519/proof_0.1.0-main.20260428070519_darwin_arm64.tar.gz"
      sha256 "ad802a07ce95f9d1d92c15416f80033432795c94b2fd83dba4ee4a13aeff7c76"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260428070519/proof_0.1.0-main.20260428070519_darwin_amd64.tar.gz"
      sha256 "0b3f2b06dfa5b81b162a1268812801a24e9f1887c6ff419d1ce079175cae6232"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260428070519/proof_0.1.0-main.20260428070519_linux_arm64.tar.gz"
      sha256 "23f81d21c8578bc294403c44502e294c06d6a78e37ccf4988622f54c5d2d65e7"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260428070519/proof_0.1.0-main.20260428070519_linux_amd64.tar.gz"
      sha256 "122d81c74b879f275d3ae9b53bc768976908b992ef78a8bc7d5fc2b2b4c1ff69"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260428070519", output
  end
end
