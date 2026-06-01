class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260601071238"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260601071238/proof_0.1.0-main.20260601071238_darwin_arm64.tar.gz"
      sha256 "95c1e27ebba0df722b1641dc9f11a244fccd007bc3e411d68e17284e836f4e6e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260601071238/proof_0.1.0-main.20260601071238_darwin_amd64.tar.gz"
      sha256 "5e22a79fa23f4abe2ad54055e174ea0aba3345fec24593c98a27c8d4fe7849ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260601071238/proof_0.1.0-main.20260601071238_linux_arm64.tar.gz"
      sha256 "240b72300522a990574e0c78c9289fdc1fbd7d5a570de54ffe0185c09b03f991"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260601071238/proof_0.1.0-main.20260601071238_linux_amd64.tar.gz"
      sha256 "8f1f6ab95ea66bc3ce7ce85edba5b6fae7568e24d242681b390080475e1c3ab5"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260601071238", output
  end
end
