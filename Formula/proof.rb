class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260822065721"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822065721/proof_0.1.0-main.20260822065721_darwin_arm64.tar.gz"
      sha256 "9ae705efaf319ea8ee4352febdbf1b3919ec452e2d42152f9fce583104703399"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822065721/proof_0.1.0-main.20260822065721_darwin_amd64.tar.gz"
      sha256 "cbec74ebe875f122968b8e73015fcd14a7e997358cd096f037030bfa65c101d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822065721/proof_0.1.0-main.20260822065721_linux_arm64.tar.gz"
      sha256 "7c4c30b8003df8af579ae798756e6d8a7c591c17512ceed0dbec917fcf9ad96d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822065721/proof_0.1.0-main.20260822065721_linux_amd64.tar.gz"
      sha256 "1759f2df7ccc2d366116d5af31667876e9c14652c624b5b3ab1dcedac9ab73e0"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260822065721", output
  end
end
