class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260806093418"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806093418/proof_0.1.0-main.20260806093418_darwin_arm64.tar.gz"
      sha256 "36949aeebc57078e3b723b51ed24470a8636eec702749d978829230187510a41"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806093418/proof_0.1.0-main.20260806093418_darwin_amd64.tar.gz"
      sha256 "e81db7377f4a6346db62074bd5d82728bff896d5c8d9724e8c4fe30c0e79b67a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806093418/proof_0.1.0-main.20260806093418_linux_arm64.tar.gz"
      sha256 "60b9512e988cec4476e910713fd9fa34a4d85755a3911089f869cb17c5b31810"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806093418/proof_0.1.0-main.20260806093418_linux_amd64.tar.gz"
      sha256 "5309e9bd9cb73b08b1c03cc89db1a236fbccc66881a1551a5f8ac08f5e7cc900"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260806093418", output
  end
end
