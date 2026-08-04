class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260804185810"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804185810/proof_0.1.0-main.20260804185810_darwin_arm64.tar.gz"
      sha256 "422c7ef2371645ea52a75f31a50eb2e197145d4199ac8d7236aabd8c93523f73"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804185810/proof_0.1.0-main.20260804185810_darwin_amd64.tar.gz"
      sha256 "20933ca539bbb8cf6ccc6be4d12c2b90d82ea22085462009059493eeea8de010"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804185810/proof_0.1.0-main.20260804185810_linux_arm64.tar.gz"
      sha256 "16d919ad460f85880534f44a59aac8bf0b80abdc27fb41e800d9431b99878a14"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804185810/proof_0.1.0-main.20260804185810_linux_amd64.tar.gz"
      sha256 "8f18d09a23c35b7cd2462aa2b0e0ecc6476f1a75a48a7b25017b61f19723506a"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260804185810", output
  end
end
