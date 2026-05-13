class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260513164918"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260513164918/proof_0.1.0-main.20260513164918_darwin_arm64.tar.gz"
      sha256 "e07e058c76dd46fb724468e482c631a2a2a5a2e2359d30c4823c8deefdcc903f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260513164918/proof_0.1.0-main.20260513164918_darwin_amd64.tar.gz"
      sha256 "ace947f6da959bef10b0ca134ffd7248a54250bbad2cc64690e02223ed8840b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260513164918/proof_0.1.0-main.20260513164918_linux_arm64.tar.gz"
      sha256 "ed701d0e8047385ab6b952191cfa7ca276a887c8eae8a0b268a23c2230491c3e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260513164918/proof_0.1.0-main.20260513164918_linux_amd64.tar.gz"
      sha256 "a30da79ce1d069e897638628815e5715236844f224503005dc759e6a7ffdd2cd"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260513164918", output
  end
end
