class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260428064046"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260428064046/proof_0.1.0-main.20260428064046_darwin_arm64.tar.gz"
      sha256 "b331d24fd3a25ac3085ad511b60d4ae13c1e7e642724c002b5b2b2859866c74d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260428064046/proof_0.1.0-main.20260428064046_darwin_amd64.tar.gz"
      sha256 "1a6ca7a07b696946950cb86c26beaf022907795528813a1a5fb02b516d3981d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260428064046/proof_0.1.0-main.20260428064046_linux_arm64.tar.gz"
      sha256 "a0781d1b4cf19b7f9d6508be88889b049f69ca6979314a623eb72b044d4f0f8d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260428064046/proof_0.1.0-main.20260428064046_linux_amd64.tar.gz"
      sha256 "ba4e9191a81b1625d782a388e1023d1508b0e6396376403be461e74314fd5ac6"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260428064046", output
  end
end
