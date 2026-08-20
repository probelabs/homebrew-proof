class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260820134135"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820134135/proof_0.1.0-main.20260820134135_darwin_arm64.tar.gz"
      sha256 "79d320cf517a6722dc71c5820cad5c5b0cde42f95c6d2e22afb9524c7bc7ece2"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820134135/proof_0.1.0-main.20260820134135_darwin_amd64.tar.gz"
      sha256 "89056409542bbdcc81a1a82aeeded658f03aca90ca5a6e357e49ac97d045bf44"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820134135/proof_0.1.0-main.20260820134135_linux_arm64.tar.gz"
      sha256 "63a0320c7699dfeb7247e997061aa3366b5fb972ad6ba8a47f564fa772c7335f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260820134135/proof_0.1.0-main.20260820134135_linux_amd64.tar.gz"
      sha256 "5032b5cd21e69572fd004f37642103a52fa018adb6a63b688fbc1e85c88e9c8f"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260820134135", output
  end
end
