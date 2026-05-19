class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260519094114"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519094114/proof_0.1.0-main.20260519094114_darwin_arm64.tar.gz"
      sha256 "154bb9847291b90a4ea449458c1aefc976e3e21468e78cd6b36c51cbddfdd281"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519094114/proof_0.1.0-main.20260519094114_darwin_amd64.tar.gz"
      sha256 "c5ee9eb0db405551acbc16ab93d2eff7c695dcdb2e8107e9979c09bd6dfddad1"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519094114/proof_0.1.0-main.20260519094114_linux_arm64.tar.gz"
      sha256 "f683f8f6ea5a3aca5a3db4e54c62ba81d56aed00196241aa7384680f665af023"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519094114/proof_0.1.0-main.20260519094114_linux_amd64.tar.gz"
      sha256 "1aa66c6809e870dfbe9fbddb03d62234668cca324c33f1eb8b70f2b8ae5d7c83"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260519094114", output
  end
end
