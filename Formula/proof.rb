class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260809080852"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809080852/proof_0.1.0-main.20260809080852_darwin_arm64.tar.gz"
      sha256 "f98e23a3fdba8b2e533638b3123062c1f2d8cdfb7776a20303c8fde72fa8be10"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809080852/proof_0.1.0-main.20260809080852_darwin_amd64.tar.gz"
      sha256 "10669a457cc030f628ed4df3acbb59218453de3c8c4ed764e4660ad05895b83d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809080852/proof_0.1.0-main.20260809080852_linux_arm64.tar.gz"
      sha256 "2178827e31e547d4b3a85994db42f01c001645ac3e873634c9be674ea26ef87d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260809080852/proof_0.1.0-main.20260809080852_linux_amd64.tar.gz"
      sha256 "223626157bba4983e2a4c4a881058dcfcf53cc3748e3f4ccdb6ea949af726fba"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260809080852", output
  end
end
