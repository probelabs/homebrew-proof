class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260419142759"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260419142759/proof_0.1.0-main.20260419142759_darwin_arm64.tar.gz"
      sha256 "941be0c339e112ac41afe603ef9b737738a4b36d708f71fd954349a7ce532e84"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260419142759/proof_0.1.0-main.20260419142759_darwin_amd64.tar.gz"
      sha256 "afdda23a91d26be03d1cacb8fc3b54b285a940437afa44ce0bb4cc80ca923a75"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260419142759/proof_0.1.0-main.20260419142759_linux_arm64.tar.gz"
      sha256 "1238b40170956cfc62187e14fab7539465a9b7a0120295945697c0bcb48d596a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260419142759/proof_0.1.0-main.20260419142759_linux_amd64.tar.gz"
      sha256 "7b3f47514203aa53be049ea88d1b996fd75d20e8e296f85100cff2f3bf6a557f"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260419142759", output
  end
end
