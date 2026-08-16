class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260816125004"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816125004/proof_0.1.0-main.20260816125004_darwin_arm64.tar.gz"
      sha256 "38ddd37af8a05922f4fa23f0b9162828ebc7c60e2a0bd539406628d395acef0e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816125004/proof_0.1.0-main.20260816125004_darwin_amd64.tar.gz"
      sha256 "b275c6cae539e53adfbd900b4ce9602acb652c29b294ab08bfec70958ae61c09"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816125004/proof_0.1.0-main.20260816125004_linux_arm64.tar.gz"
      sha256 "dbb484ef53012be88459eef91bc2c7eb4b9d3166cd910cd9efedc8247de065b7"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816125004/proof_0.1.0-main.20260816125004_linux_amd64.tar.gz"
      sha256 "783b78c87af18ae60b75dc9fd88509d7b04952f1be3d370e9fc8561f6d9c8487"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260816125004", output
  end
end
