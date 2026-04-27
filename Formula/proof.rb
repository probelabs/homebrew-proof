class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427153310"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427153310/proof_0.1.0-main.20260427153310_darwin_arm64.tar.gz"
      sha256 "f7e725427c3f783e609b7ecd6ab4eca957be908a08e07683fd105edf40eaf48d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427153310/proof_0.1.0-main.20260427153310_darwin_amd64.tar.gz"
      sha256 "8a062657ea83cc52c4ba4ae396ce3b31493802b8fdad601506fff743e7b67229"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427153310/proof_0.1.0-main.20260427153310_linux_arm64.tar.gz"
      sha256 "d246b9811f506d065cfc56d0f1243514c39662e49c7d8b41c9ef631e9389b2ee"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427153310/proof_0.1.0-main.20260427153310_linux_amd64.tar.gz"
      sha256 "797c1cfb878478985ba19cae7a0afff8939ddb0e5947495a811703a088644d15"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427153310", output
  end
end
