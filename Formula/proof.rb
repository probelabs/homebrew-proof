class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260806100239"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806100239/proof_0.1.0-main.20260806100239_darwin_arm64.tar.gz"
      sha256 "afb570eeb3caf1a181c2491278b42aec0f3ece779430438d6e0b91358c48bed2"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806100239/proof_0.1.0-main.20260806100239_darwin_amd64.tar.gz"
      sha256 "d4eac31c7670bc500923a6c7e54d965b341a6fa1fe9130570b875d2db3f66fff"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806100239/proof_0.1.0-main.20260806100239_linux_arm64.tar.gz"
      sha256 "885bf7ffebb12300dc90ff6717822009183758004cda0ce695cb050b8a728477"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806100239/proof_0.1.0-main.20260806100239_linux_amd64.tar.gz"
      sha256 "1a98803a4bd2fcd3e7bacf482df41f4c45050310b3791ad553ccd85ff3bdb2c1"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260806100239", output
  end
end
