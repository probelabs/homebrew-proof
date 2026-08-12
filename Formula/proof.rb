class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260812095321"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812095321/proof_0.1.0-main.20260812095321_darwin_arm64.tar.gz"
      sha256 "efb49401ff9604ea4664b51ecc1d11394805c51ba9d5b161b945b4df02116ff9"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812095321/proof_0.1.0-main.20260812095321_darwin_amd64.tar.gz"
      sha256 "54235d967e97fddaf87716670b39ed868feecaa060f4a30beb06d50eb949f838"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812095321/proof_0.1.0-main.20260812095321_linux_arm64.tar.gz"
      sha256 "1f312041e7f8fb8443ecdc4ea659cf3ec04bf1947849a09df9a9ecca48c6bd7a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812095321/proof_0.1.0-main.20260812095321_linux_amd64.tar.gz"
      sha256 "3404d9790628b2fc01eca79a50ffff86b97ecba11f9c8c0fd13082d7fdb7b3fc"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260812095321", output
  end
end
