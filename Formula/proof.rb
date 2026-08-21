class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260821230402"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821230402/proof_0.1.0-main.20260821230402_darwin_arm64.tar.gz"
      sha256 "9c8e9b7151b249c18d773ddf17b49d5674b61fbd8b54f4eb17383d56b38e733b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821230402/proof_0.1.0-main.20260821230402_darwin_amd64.tar.gz"
      sha256 "fa36af47c89589689eb2e78ec6029dfe20e37f75bb206e380a22c5c42dc30ee0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821230402/proof_0.1.0-main.20260821230402_linux_arm64.tar.gz"
      sha256 "c0815dfe021c98f917add903b0c1e3c82db43f774313ea574bf40fb4430a4338"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821230402/proof_0.1.0-main.20260821230402_linux_amd64.tar.gz"
      sha256 "79a8bb504ed3362bf33fc4cd4a2cd7187f45f18c5133d5b08a01196c61d40a88"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260821230402", output
  end
end
