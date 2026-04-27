class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427135341"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427135341/proof_0.1.0-main.20260427135341_darwin_arm64.tar.gz"
      sha256 "d2de698370cb970a77e121e65f1830dc41dc3034c6b098e3cb729dd75afd8d65"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427135341/proof_0.1.0-main.20260427135341_darwin_amd64.tar.gz"
      sha256 "7dac24120d90a840366a9d8ced2c059001b748d0be83337c8ae07dfea31735ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427135341/proof_0.1.0-main.20260427135341_linux_arm64.tar.gz"
      sha256 "af5672e29bb4d9c47b05bbb3aa4433e0ab8b8d066dbc0c2fa8524f555bd5c074"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427135341/proof_0.1.0-main.20260427135341_linux_amd64.tar.gz"
      sha256 "0af46153acb2eec657e187b8f968a2ccb0a995f405905fe3430d7090bab0e1fa"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427135341", output
  end
end
