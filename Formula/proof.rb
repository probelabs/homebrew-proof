class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260807191519"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260807191519/proof_0.1.0-main.20260807191519_darwin_arm64.tar.gz"
      sha256 "964897d5a959efe2a773b17f57e967e8b41a3518923b9a33a1853257bef054ad"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260807191519/proof_0.1.0-main.20260807191519_darwin_amd64.tar.gz"
      sha256 "f6b793ae1106f85eaca622c8339235b6a51a7bd2b822cd0d4070b88fef51a55c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260807191519/proof_0.1.0-main.20260807191519_linux_arm64.tar.gz"
      sha256 "3ed3429ea9da451887db6e78464a37847a99a9acb54e2d9cd1cf339534544027"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260807191519/proof_0.1.0-main.20260807191519_linux_amd64.tar.gz"
      sha256 "ebbc1b9fdb00007a7139fac57e7c8b2dc3c03fac7126d6516f6fad584a9d358f"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260807191519", output
  end
end
