class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817115507"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817115507/proof_0.1.0-main.20260817115507_darwin_arm64.tar.gz"
      sha256 "21953431c795d105deeb235625548e42674edbb2db2d25f4e790ff7c2e4b5f12"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817115507/proof_0.1.0-main.20260817115507_darwin_amd64.tar.gz"
      sha256 "cc3edc7d3deba6c0c43da7e3c4bebbad5e07bd1ad1d532cca95d2657008898ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817115507/proof_0.1.0-main.20260817115507_linux_arm64.tar.gz"
      sha256 "09d227a68bfb27a421cc31644b2ba501ee46475e7d4fe5a62bc2b2016cfe1952"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817115507/proof_0.1.0-main.20260817115507_linux_amd64.tar.gz"
      sha256 "23e5de6bde48dfe1eed605f37e630d902b7be5c4ff2da61c53763ed954c7f104"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817115507", output
  end
end
