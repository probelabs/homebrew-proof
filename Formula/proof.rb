class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260803103218"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803103218/proof_0.1.0-main.20260803103218_darwin_arm64.tar.gz"
      sha256 "d1ca2d886ec5b25610f0553b139b95c25713e2e99238aa9c26158b7f86b817a2"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803103218/proof_0.1.0-main.20260803103218_darwin_amd64.tar.gz"
      sha256 "84ea5e0faf97e86de61690b0d69177af9f2ceeb92cb0ff1fa4c20df151cb87d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803103218/proof_0.1.0-main.20260803103218_linux_arm64.tar.gz"
      sha256 "8f4e5a6563dd67f0e1a8a75e633eee1d58166af2794305563d8f7e7701be18b5"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260803103218/proof_0.1.0-main.20260803103218_linux_amd64.tar.gz"
      sha256 "871121f0cd76326db02feae787112fc0301987aa2920f57705f9a52ee7276d34"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260803103218", output
  end
end
