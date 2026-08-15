class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260815180603"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260815180603/proof_0.1.0-main.20260815180603_darwin_arm64.tar.gz"
      sha256 "09b791c326703a80f5e94c792ebe589cfdffa897485b222917911821131819d4"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260815180603/proof_0.1.0-main.20260815180603_darwin_amd64.tar.gz"
      sha256 "832434b0c9c22b15e4c81778625939587a3359aec0340829760d1b1766bdcc8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260815180603/proof_0.1.0-main.20260815180603_linux_arm64.tar.gz"
      sha256 "148884724a1d5b300517e2553ac587b70242095b607b2f804c489a79ab79a549"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260815180603/proof_0.1.0-main.20260815180603_linux_amd64.tar.gz"
      sha256 "6370eabd828d67649b85e372f38aff546be9d553d5356f6c2279a7c7dbe4b688"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260815180603", output
  end
end
