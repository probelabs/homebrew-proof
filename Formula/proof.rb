class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260822044130"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822044130/proof_0.1.0-main.20260822044130_darwin_arm64.tar.gz"
      sha256 "982aabe4ab550c1e658e0afd69d9b0952a811a3f9cbffd6f0afc58731cbb4e60"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822044130/proof_0.1.0-main.20260822044130_darwin_amd64.tar.gz"
      sha256 "1eaf88c77b0a05bada63f13c98e6ecab5baa6a030acabb14b5ad1d8dc257bed6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822044130/proof_0.1.0-main.20260822044130_linux_arm64.tar.gz"
      sha256 "32d63b2863e290f3f2b4e45104dcc2d70402468c5af7c86bb2a9ae5cb3720b8c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822044130/proof_0.1.0-main.20260822044130_linux_amd64.tar.gz"
      sha256 "8605b3ffd1781ec1b9d5ebff3c52cddd896db89c60265ebf9b6dd7221d5d30f4"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260822044130", output
  end
end
