class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260820090759"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820090759/proof_0.1.0-main.20260820090759_darwin_arm64.tar.gz"
      sha256 "3b8fecfadfaec68f0532db56874694aba6f9a7255d4536fa56fc5f3eb3aa48c8"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820090759/proof_0.1.0-main.20260820090759_darwin_amd64.tar.gz"
      sha256 "2dc28036619bc3127cd1e8941da859bedfcd1348f899d32372e209258c754875"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820090759/proof_0.1.0-main.20260820090759_linux_arm64.tar.gz"
      sha256 "50dfe99e76fff9f0f0f9563600568348d69bf5e020bfa5f4004482c29bddf249"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820090759/proof_0.1.0-main.20260820090759_linux_amd64.tar.gz"
      sha256 "453df84294490ec7547517822bdff8b5ea72e81f8d02894ca887d8ad7792fa3a"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260820090759", output
  end
end
