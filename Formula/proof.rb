class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260521193406"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260521193406/proof_0.1.0-main.20260521193406_darwin_arm64.tar.gz"
      sha256 "b4182b0d13736ad4ceb7fffdb73e7a8ce63c3783c1888d174472c5403f406117"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260521193406/proof_0.1.0-main.20260521193406_darwin_amd64.tar.gz"
      sha256 "ea5edd6d2e239185831a61940add48e44a79cd79a0c9838856407a19a73b4811"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260521193406/proof_0.1.0-main.20260521193406_linux_arm64.tar.gz"
      sha256 "84887338ba74204ae94e9ff2dcd254b86aa24b171bc25cc887086789858758f6"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260521193406/proof_0.1.0-main.20260521193406_linux_amd64.tar.gz"
      sha256 "ee401d831e20f5c60e3870219c2fba22737f01c5a8ac2a03eb7d5271d2324c94"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260521193406", output
  end
end
