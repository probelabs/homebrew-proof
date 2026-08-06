class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260806065742"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806065742/proof_0.1.0-main.20260806065742_darwin_arm64.tar.gz"
      sha256 "76a963bbc3b71cad9229aa462135ef5173c33b64da0ea1a6bfa7d52d717d23b4"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806065742/proof_0.1.0-main.20260806065742_darwin_amd64.tar.gz"
      sha256 "39eef7c257d21ab2420036095171972d62aaa87a2d49508952f7fa0f6fecfb49"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806065742/proof_0.1.0-main.20260806065742_linux_arm64.tar.gz"
      sha256 "052dd50cfa825d63d8df15316a7f1728275f51e5c4d918ecdc209565053e8c50"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260806065742/proof_0.1.0-main.20260806065742_linux_amd64.tar.gz"
      sha256 "a5fc3242cc262c9a28445a271359cb3dfd2fe65497c9c0b22214139a6420babf"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260806065742", output
  end
end
