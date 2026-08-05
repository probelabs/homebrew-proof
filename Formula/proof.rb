class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260805091854"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805091854/proof_0.1.0-main.20260805091854_darwin_arm64.tar.gz"
      sha256 "f65ee5a28771c6eaf54b251a3afedb6eb6b0f4227e77eeeb8ccc12e8555f0c49"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805091854/proof_0.1.0-main.20260805091854_darwin_amd64.tar.gz"
      sha256 "2c325b3af3c87160b91d3babf251dee4d9ee20c737edc9ef7679c4d49830b7c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805091854/proof_0.1.0-main.20260805091854_linux_arm64.tar.gz"
      sha256 "0191937714e132aec5b97527c328bfde77f64527c694900023caa273fb710dc1"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260805091854/proof_0.1.0-main.20260805091854_linux_amd64.tar.gz"
      sha256 "373d84b2cc313150b08debe557d504b3c52b8b6456a227736a9e97b43274c6ba"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260805091854", output
  end
end
