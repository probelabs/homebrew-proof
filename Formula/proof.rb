class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260519180908"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519180908/proof_0.1.0-main.20260519180908_darwin_arm64.tar.gz"
      sha256 "4e6ebd142728550893a9b3a0dd3757e3bc3bdf3bb7cdb7f3d7ad56e55ae9a033"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519180908/proof_0.1.0-main.20260519180908_darwin_amd64.tar.gz"
      sha256 "ce0a7820f4e19d62a51e72049f43b182daac53072ffd43445092518a08e7e317"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519180908/proof_0.1.0-main.20260519180908_linux_arm64.tar.gz"
      sha256 "90cfb74044f2641b8b98ac16f472759d669ad36617c723f031a5adf65a94fe14"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519180908/proof_0.1.0-main.20260519180908_linux_amd64.tar.gz"
      sha256 "7471094c26a4952b4beb231444ddb3b57c5c23f61e8f3a0246c2bb4a73f9b1bc"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260519180908", output
  end
end
