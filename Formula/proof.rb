class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260823201823"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823201823/proof_0.1.0-main.20260823201823_darwin_arm64.tar.gz"
      sha256 "3819b06130d3d7bb9ba802ba8e8a3d20334a750f56b20bfdf965d0a7a7eb9279"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823201823/proof_0.1.0-main.20260823201823_darwin_amd64.tar.gz"
      sha256 "661fc91582f1aabd2cc033c1eb8626c7c51ea740a73a4d41ee61fbd1dcac6393"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823201823/proof_0.1.0-main.20260823201823_linux_arm64.tar.gz"
      sha256 "60ba2f0c0dfe4d16b21093cc0b27a53c477c3529d90bfd969a2ccce47ca50a92"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260823201823/proof_0.1.0-main.20260823201823_linux_amd64.tar.gz"
      sha256 "48eab26564f86445bb8725290ec83962b05bc131a9cf337e81f64d07cb53fd3a"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260823201823", output
  end
end
