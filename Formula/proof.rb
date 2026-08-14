class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260814161307"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814161307/proof_0.1.0-main.20260814161307_darwin_arm64.tar.gz"
      sha256 "5e95c25e814a9650c8b28a891f191c48779278569432675c96abe078968028f4"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814161307/proof_0.1.0-main.20260814161307_darwin_amd64.tar.gz"
      sha256 "ce8f2123a7d1a2366addbb418a76e45a281919df97980e2910862d1c4d72e650"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814161307/proof_0.1.0-main.20260814161307_linux_arm64.tar.gz"
      sha256 "4bd52b4f6eab6bdaa5b1513b1e3e36e9c1fc0bebcb4147fff54c98668d5670b3"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814161307/proof_0.1.0-main.20260814161307_linux_amd64.tar.gz"
      sha256 "4fa7f186dbd2408ff4a34de8e9421465eb392bbfe94c893b33944d605335fa37"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260814161307", output
  end
end
