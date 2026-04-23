class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260423120412"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260423120412/proof_0.1.0-main.20260423120412_darwin_arm64.tar.gz"
      sha256 "0f134bf7d5c1b3b559ca718a6578fe6762f1abf1cfd716b9109e684d88d223e2"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260423120412/proof_0.1.0-main.20260423120412_darwin_amd64.tar.gz"
      sha256 "0114c519bef21ce7132900086a05b76a5d6aa37355eb6b4dd1828fdc65762b49"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260423120412/proof_0.1.0-main.20260423120412_linux_arm64.tar.gz"
      sha256 "7f0fee16bb3a7f4eee19979d82da3da13065c16e877103c9199df16a398faacb"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260423120412/proof_0.1.0-main.20260423120412_linux_amd64.tar.gz"
      sha256 "1a94d03c9e13077de9347335190893b4e7b510e73545b261b7e6f671b3e57c0e"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260423120412", output
  end
end
