class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260426151228"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260426151228/proof_0.1.0-main.20260426151228_darwin_arm64.tar.gz"
      sha256 "626a0d437f2dd6b2903ea2a8e8e9b585ee4bc453972579ed9c2015c2b920d808"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260426151228/proof_0.1.0-main.20260426151228_darwin_amd64.tar.gz"
      sha256 "70378bf640bbf9858bdb1c942b996e76b4f8c1ed36a035beddfa9dbc11b66f81"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260426151228/proof_0.1.0-main.20260426151228_linux_arm64.tar.gz"
      sha256 "c5935e1c215ce9ffb77898d3a25665e2693698249f6c9ff4d0111ee655691a51"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260426151228/proof_0.1.0-main.20260426151228_linux_amd64.tar.gz"
      sha256 "0c6a2999a37fc9fa3affb61c5d609a8d20f98e13b74819f0d35696865bc380d8"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260426151228", output
  end
end
