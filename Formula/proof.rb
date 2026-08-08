class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260808065246"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808065246/proof_0.1.0-main.20260808065246_darwin_arm64.tar.gz"
      sha256 "65c8acfa574b2df2652953fb07c193e1d08020387343ed6756785c74ca77349b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808065246/proof_0.1.0-main.20260808065246_darwin_amd64.tar.gz"
      sha256 "6c9d55addedd440d3b2d2627fda86686cb18a7584768bf0096c7e1b848a2503c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808065246/proof_0.1.0-main.20260808065246_linux_arm64.tar.gz"
      sha256 "d115d80538e8ef74f8b272328c30475ee669b6d18cd1eead7cd82f0a0c44680c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260808065246/proof_0.1.0-main.20260808065246_linux_amd64.tar.gz"
      sha256 "a1e5077e7e5b44371cacb3ea8012d5c651f85c47e160d9cfaf94258a8a9dc9bc"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260808065246", output
  end
end
