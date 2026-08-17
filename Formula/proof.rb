class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260817074516"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817074516/proof_0.1.0-main.20260817074516_darwin_arm64.tar.gz"
      sha256 "467235fd1001936f7bb911fe3fefd3f78d40c376841951839c02bdbdac8ed5e5"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817074516/proof_0.1.0-main.20260817074516_darwin_amd64.tar.gz"
      sha256 "561c3b141817f90a204818e93e6c3efc6068e8b13b1e3898665d9e43f262b6ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817074516/proof_0.1.0-main.20260817074516_linux_arm64.tar.gz"
      sha256 "97adabdc7b89ec599a1eb1e051883b08e1d1e9886c5f12576e7b27393fe0bb32"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260817074516/proof_0.1.0-main.20260817074516_linux_amd64.tar.gz"
      sha256 "32b64ffab77c199ea0fdd65deeb2d612b75b4e1e21488cd8c69f18644af8fb80"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260817074516", output
  end
end
