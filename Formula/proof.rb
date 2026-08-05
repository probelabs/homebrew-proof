class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260805101630"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805101630/proof_0.1.0-main.20260805101630_darwin_arm64.tar.gz"
      sha256 "494006fd5157c8d92cc2b93f3a4acd5e83d085d980a9da67f8b8b96a1b9164ed"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805101630/proof_0.1.0-main.20260805101630_darwin_amd64.tar.gz"
      sha256 "100bd337cb1a667ca080c1ec86c3c8eeac53b0fc891ae6444d7342e7e12fe291"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805101630/proof_0.1.0-main.20260805101630_linux_arm64.tar.gz"
      sha256 "01732a1aea185516a16829c034ae0acf21d4363b3bb6eabe45bd1b7d4dab8e15"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805101630/proof_0.1.0-main.20260805101630_linux_amd64.tar.gz"
      sha256 "d994539c36a1b7bdf0b50b70084961292f54d5a38edac80d58f6407e20050f14"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260805101630", output
  end
end
