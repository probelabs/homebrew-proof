class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817092451"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817092451/proof_0.1.0-main.20260817092451_darwin_arm64.tar.gz"
      sha256 "5ad08bbba7802544a45483877dada03a97866040c576393059ca56a6104ab0a6"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817092451/proof_0.1.0-main.20260817092451_darwin_amd64.tar.gz"
      sha256 "1db3b84e6344a5d502449b5e3aae4620a1a1118d9eca41e5fd27011a907f050d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817092451/proof_0.1.0-main.20260817092451_linux_arm64.tar.gz"
      sha256 "dbbd33e0769973f5ab9cf3226e327ebe4edc20225ca6e389b604602f93d910cb"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817092451/proof_0.1.0-main.20260817092451_linux_amd64.tar.gz"
      sha256 "06566a0a8496ac28fbe3dc42279f00284e37f31880921eabca4b4542db33fb15"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817092451", output
  end
end
