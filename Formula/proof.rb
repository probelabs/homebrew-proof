class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260821102323"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821102323/proof_0.1.0-main.20260821102323_darwin_arm64.tar.gz"
      sha256 "75092ca582961489e8d0d39adfb9756d19be339671c0c7232e252b075cdcf55b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821102323/proof_0.1.0-main.20260821102323_darwin_amd64.tar.gz"
      sha256 "c687c77550a111db290b050e2ffb00b6fc3aff99d87b14b054a321fbfebd8f66"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821102323/proof_0.1.0-main.20260821102323_linux_arm64.tar.gz"
      sha256 "cfda8be48426c381d057bc74d90db1870148a7748565e90e5dcceacd66348d01"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821102323/proof_0.1.0-main.20260821102323_linux_amd64.tar.gz"
      sha256 "3cce2e2206bd28e1428d44f783b11431c78e714bbd9d47cb6f74bdd3fbe36a94"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260821102323", output
  end
end
