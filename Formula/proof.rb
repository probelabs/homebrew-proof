class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260823183815"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823183815/proof_0.1.0-main.20260823183815_darwin_arm64.tar.gz"
      sha256 "6a82e6428b330c33b52a57d397149096b8d6b50437eae9148ab8994d73d7924a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823183815/proof_0.1.0-main.20260823183815_darwin_amd64.tar.gz"
      sha256 "150d7a2d72fa9ca30430b5a5a983600dcc8cb8de0263f28c9b1b525c07373155"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823183815/proof_0.1.0-main.20260823183815_linux_arm64.tar.gz"
      sha256 "7a58b250f40c827d7beb3a19ec8688b21dc04eae8d3e6a65cfda8dd35eee7442"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823183815/proof_0.1.0-main.20260823183815_linux_amd64.tar.gz"
      sha256 "359e2937077523bbe6c0d8d9b5859347845fe6257037e7bed50375f4c0458d66"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260823183815", output
  end
end
