class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427202552"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427202552/proof_0.1.0-main.20260427202552_darwin_arm64.tar.gz"
      sha256 "1e8a99f350c3481d0a4519f183faa7b11dbaf93a3bd55017b9bbc66005baac5a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427202552/proof_0.1.0-main.20260427202552_darwin_amd64.tar.gz"
      sha256 "5661d18e4caaff9873f1e3b2c64a2dd5b73dd6ded795720e2d7424ce67f4fc09"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427202552/proof_0.1.0-main.20260427202552_linux_arm64.tar.gz"
      sha256 "624ded27beccdb914ae319bd116e2737c4312daf3531d8365af59b27a5218071"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427202552/proof_0.1.0-main.20260427202552_linux_amd64.tar.gz"
      sha256 "614254d04030ca479ca8857274bbb16940b975e8ac00664b17b2e861968a4003"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427202552", output
  end
end
