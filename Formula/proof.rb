class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260519130221"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519130221/proof_0.1.0-main.20260519130221_darwin_arm64.tar.gz"
      sha256 "cc9493c36733bf7e094f6450827772d466262f130edba006613281140f27e13b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519130221/proof_0.1.0-main.20260519130221_darwin_amd64.tar.gz"
      sha256 "3b439c6e10b6e9304ec2bfa73d63b294568e06218034205bad633f522a888a79"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519130221/proof_0.1.0-main.20260519130221_linux_arm64.tar.gz"
      sha256 "a3615ace2e50dcfa397b80aca0fe51c693051caff7b356b7342b86ed3f61cccb"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519130221/proof_0.1.0-main.20260519130221_linux_amd64.tar.gz"
      sha256 "0e17c565402e87a241fc36a8e29ce77d5af213a563ca12e777eeefe12a5c8181"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260519130221", output
  end
end
