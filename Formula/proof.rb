class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427184934"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427184934/proof_0.1.0-main.20260427184934_darwin_arm64.tar.gz"
      sha256 "fa57c6e48acb9cc4319409e4c6a79bd9e20f51a36f037631d5088ad6b2fb4cae"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427184934/proof_0.1.0-main.20260427184934_darwin_amd64.tar.gz"
      sha256 "69c3b5931b8e191a41efdc3156fb61dd1f89c3cfd751da05152dd8e59e12ca21"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427184934/proof_0.1.0-main.20260427184934_linux_arm64.tar.gz"
      sha256 "cb3d27e6f6c42f2b55fdb7b989ff85ed223d9632e831763baf5483f80a71a6e2"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427184934/proof_0.1.0-main.20260427184934_linux_amd64.tar.gz"
      sha256 "355a6e6e187ddce5d7ca5f14b13d83fe6d73d1b4fcd72490fb2310b9173d5fc8"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427184934", output
  end
end
