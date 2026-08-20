class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260820102058"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820102058/proof_0.1.0-main.20260820102058_darwin_arm64.tar.gz"
      sha256 "39856534b17b66e4e13b825a2bb1e69754736fce13dce7b30f4bd2c5207ea981"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820102058/proof_0.1.0-main.20260820102058_darwin_amd64.tar.gz"
      sha256 "1f5603b92bc4ff099ee3cdb6bc5aaba8333df33dd18d28e88ba63ad5a8fc203d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820102058/proof_0.1.0-main.20260820102058_linux_arm64.tar.gz"
      sha256 "eb6b6b437d10d24a203d318eed2f6bbd2f8368fc6de07c2a27b965c4830aacbf"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820102058/proof_0.1.0-main.20260820102058_linux_amd64.tar.gz"
      sha256 "b45739b9ff439c87a694a3c0a05b76b0f80e92c90e83adbee72ae2d7c058c60e"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260820102058", output
  end
end
