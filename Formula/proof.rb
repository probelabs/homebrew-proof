class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260424152959"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424152959/proof_0.1.0-main.20260424152959_darwin_arm64.tar.gz"
      sha256 "d923f091b8ba60b94597ec65f1a8e645ea0892687090c4263bd7069c71bc42b5"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424152959/proof_0.1.0-main.20260424152959_darwin_amd64.tar.gz"
      sha256 "f394b3ffc1488c2e5abe81c53b5fff625db64a77f3cc9103e75aeaed6b397953"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424152959/proof_0.1.0-main.20260424152959_linux_arm64.tar.gz"
      sha256 "af8d48c4f6256e573bdd1ae6a9c5b693c2ea4a1a8ca9fba6fef99c8c279b8f9a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424152959/proof_0.1.0-main.20260424152959_linux_amd64.tar.gz"
      sha256 "21364dcf76f8a8bd9be397e4b029571d971f224f08882cf806622af0d12a19f2"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260424152959", output
  end
end
