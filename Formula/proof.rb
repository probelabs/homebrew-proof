class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427174558"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427174558/proof_0.1.0-main.20260427174558_darwin_arm64.tar.gz"
      sha256 "0ca3ec0b860524c085e2fa82182329e7f9a8b1b4029675e2a3fd33de4979c161"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427174558/proof_0.1.0-main.20260427174558_darwin_amd64.tar.gz"
      sha256 "39d3b1a4a809322152bba32ed35d3d1a89a26cadef98be68e774452bb92885d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427174558/proof_0.1.0-main.20260427174558_linux_arm64.tar.gz"
      sha256 "30d30e8d29acba124d28acf4412406a1b00bde656f7e75fa920b8ad7a0bcf916"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427174558/proof_0.1.0-main.20260427174558_linux_amd64.tar.gz"
      sha256 "15ffc15070ef7a7d0a393dc4c8b4eb185a20e1d5b2b4b16823971b51cc31ae7d"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427174558", output
  end
end
