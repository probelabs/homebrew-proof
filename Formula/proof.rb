class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427160527"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427160527/proof_0.1.0-main.20260427160527_darwin_arm64.tar.gz"
      sha256 "fda6a6cac5a2d0b040bdcab520161cb6d889243f6bbe8dc2198b3f8c369f05b7"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427160527/proof_0.1.0-main.20260427160527_darwin_amd64.tar.gz"
      sha256 "d3ab8802778b96e30d420e70f5d7cb740e0ef4c70ede6cf946b401190401b8a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427160527/proof_0.1.0-main.20260427160527_linux_arm64.tar.gz"
      sha256 "1ccd2866960767bdee91b299c1087598fc85b0e1dc9e50e16e5d304599e80e7b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427160527/proof_0.1.0-main.20260427160527_linux_amd64.tar.gz"
      sha256 "2fd9a703c2872f7d0ba068a572f8d28f4bef776e3706064c13009b704f2f3b80"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427160527", output
  end
end
