class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260821132019"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821132019/proof_0.1.0-main.20260821132019_darwin_arm64.tar.gz"
      sha256 "3767057ba74077bc0c8c9b620d91b9585c3a87e99c0ad94467d51d3055bb753e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821132019/proof_0.1.0-main.20260821132019_darwin_amd64.tar.gz"
      sha256 "d0dd7b87dd2226da622878107b59599da1a8ac2d9ed2403420ba371333f47156"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821132019/proof_0.1.0-main.20260821132019_linux_arm64.tar.gz"
      sha256 "851a9e316a37a22705db5acd2acf6e72bded1645cc58033c2ce4dbdd8ce5522d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821132019/proof_0.1.0-main.20260821132019_linux_amd64.tar.gz"
      sha256 "42312b8c37fc92dac2e144f37ad591349d936521ee106e9421fda7f15b8d54ac"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260821132019", output
  end
end
