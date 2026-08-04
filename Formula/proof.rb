class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260804122137"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804122137/proof_0.1.0-main.20260804122137_darwin_arm64.tar.gz"
      sha256 "3dcf64344438ff7b07262a48705f64d1527d27489e372078b58acc698fbe7e75"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804122137/proof_0.1.0-main.20260804122137_darwin_amd64.tar.gz"
      sha256 "12afaf9f596c17b12825d8c6ce9e095b76dfe801e07a355823fb152e62f2d09b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804122137/proof_0.1.0-main.20260804122137_linux_arm64.tar.gz"
      sha256 "8ff933b7b6440eff771e245fa945b090f762c74b72c62d43615c5f1966894ad1"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804122137/proof_0.1.0-main.20260804122137_linux_amd64.tar.gz"
      sha256 "0143c8bef1c689a974b0fd9aa309bda95dbbdfd5987c8bfb2ab3eaa6d757cb36"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260804122137", output
  end
end
