class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260820115652"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820115652/proof_0.1.0-main.20260820115652_darwin_arm64.tar.gz"
      sha256 "d1fefc8de1a2f617233168740fb4d13f1d6eb3b653d258f6e6da625b5e373f7d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820115652/proof_0.1.0-main.20260820115652_darwin_amd64.tar.gz"
      sha256 "576fc2c4509e32119088f7792a00cd695e5bca9cd2b6d41ad78c48a06ad412dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820115652/proof_0.1.0-main.20260820115652_linux_arm64.tar.gz"
      sha256 "06528d7739f40cc107de7076ae26497eda901e9d28c7383611acae73e89f5d0d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820115652/proof_0.1.0-main.20260820115652_linux_amd64.tar.gz"
      sha256 "4159973e6bcd342fb324c484bb1a3fc92c4566599e9909ce504f101fe107b6c9"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260820115652", output
  end
end
