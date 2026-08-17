class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817072018"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817072018/proof_0.1.0-main.20260817072018_darwin_arm64.tar.gz"
      sha256 "cdc63c80162326dbac1e3907c439ac24a283909052f493fe8f4a5ea8fd3ceaf6"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817072018/proof_0.1.0-main.20260817072018_darwin_amd64.tar.gz"
      sha256 "2fdf30b6aa7b3b599f5db71290389888d82becc94cd8afef10752a11d8a4d48b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817072018/proof_0.1.0-main.20260817072018_linux_arm64.tar.gz"
      sha256 "326325b62a31e8b959ecc71cc8fccca57f885799342d288abc5f01ee820b8c75"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817072018/proof_0.1.0-main.20260817072018_linux_amd64.tar.gz"
      sha256 "e17ed52c7663bf2ba8f7914beb03bb04f38009a5d54248e6489e764eda6a35bf"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817072018", output
  end
end
