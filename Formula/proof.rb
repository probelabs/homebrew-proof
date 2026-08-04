class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260804144645"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804144645/proof_0.1.0-main.20260804144645_darwin_arm64.tar.gz"
      sha256 "8c99edbb736e86615a09b2e797d957dea7c426ea565f946b2d8ba65064ab117a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804144645/proof_0.1.0-main.20260804144645_darwin_amd64.tar.gz"
      sha256 "886d28f63a7912888c152da6102882f10045b6528b5d2c32582862daec4124d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804144645/proof_0.1.0-main.20260804144645_linux_arm64.tar.gz"
      sha256 "a475656be650bc85330d409a523f7218b490e203cd64367809faf13f030b917e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804144645/proof_0.1.0-main.20260804144645_linux_amd64.tar.gz"
      sha256 "a7142667abb1c9add8f66efd48099f804c216488896ce94194cf894eca8687c1"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260804144645", output
  end
end
