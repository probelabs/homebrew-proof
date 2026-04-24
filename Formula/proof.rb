class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260424151651"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424151651/proof_0.1.0-main.20260424151651_darwin_arm64.tar.gz"
      sha256 "13f0c3ebb97d45df4d2e7d8477887054cdb36f6c687a973818076f9e0fab6a09"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424151651/proof_0.1.0-main.20260424151651_darwin_amd64.tar.gz"
      sha256 "ad7960b2478eaa66d7080f963c7b69e9813ace52da86bdf19c6702e72abe8af1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424151651/proof_0.1.0-main.20260424151651_linux_arm64.tar.gz"
      sha256 "efb76402afb4d844d66c78ece02dcd8709336197cfc07a7801ba8f9a70926bd2"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260424151651/proof_0.1.0-main.20260424151651_linux_amd64.tar.gz"
      sha256 "bac4820fbb56adbfa7a499433fdc71f4b5ce8563102efd8759b9e556efbd5816"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260424151651", output
  end
end
