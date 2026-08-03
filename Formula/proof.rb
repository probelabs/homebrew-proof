class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260803160140"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803160140/proof_0.1.0-main.20260803160140_darwin_arm64.tar.gz"
      sha256 "ff6c9be7f8dca60c16e6abdfc8e8f463b406efc4f7a00be6e34b230324859c7a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803160140/proof_0.1.0-main.20260803160140_darwin_amd64.tar.gz"
      sha256 "7250638e54548875c3853d09f86abfb7d865b0b4810ef6a5ab2082ca23b09982"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803160140/proof_0.1.0-main.20260803160140_linux_arm64.tar.gz"
      sha256 "e2e8e261deecbb1f4ceddf04068491d8a22524dc06ca8f1cc15c9512ec1fedd4"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803160140/proof_0.1.0-main.20260803160140_linux_amd64.tar.gz"
      sha256 "d8bd6554a99772a9a0f6c2da53f9c5d618fa1b2d330df9e3fa97c0d3f81ea0bc"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260803160140", output
  end
end
