class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427151704"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427151704/proof_0.1.0-main.20260427151704_darwin_arm64.tar.gz"
      sha256 "ceed2e2a5ecd6f12d8d45c526d96e6e074059ae5e90f4e936786a4d1e407a4f4"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427151704/proof_0.1.0-main.20260427151704_darwin_amd64.tar.gz"
      sha256 "17a3c28ff5523ab945e53abda837a5305bf73fa3b241530c8fc322615c783a35"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427151704/proof_0.1.0-main.20260427151704_linux_arm64.tar.gz"
      sha256 "eee38a5cd17a8fe6e9f7ea6349a75dd44d95d0e154c8b78e2cea925672b77dba"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427151704/proof_0.1.0-main.20260427151704_linux_amd64.tar.gz"
      sha256 "0ff3d23d5782f0442237945aa5f2cede65e3c268c0f79edc57ed2d315fdc60cc"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427151704", output
  end
end
