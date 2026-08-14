class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260814150619"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814150619/proof_0.1.0-main.20260814150619_darwin_arm64.tar.gz"
      sha256 "c53ec24dc1b8b1e9b60664b556b806f4628dbcb02906c19f293bc0cacc4787cf"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814150619/proof_0.1.0-main.20260814150619_darwin_amd64.tar.gz"
      sha256 "2ec6e558d6322ba5bf020fd2abe0bfedae69fd8ccf833954a728d171d957d575"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814150619/proof_0.1.0-main.20260814150619_linux_arm64.tar.gz"
      sha256 "ae19acd8d1ff9ffc16ae763be132dd9ae99803f764ee79594a82a293d70c3355"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260814150619/proof_0.1.0-main.20260814150619_linux_amd64.tar.gz"
      sha256 "3877a7cc4ba2f76d5b8df94c7a3ec0e045fb25b67ab3b7c1da5cab353668d2e9"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260814150619", output
  end
end
