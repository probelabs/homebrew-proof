class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260519184804"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519184804/proof_0.1.0-main.20260519184804_darwin_arm64.tar.gz"
      sha256 "ebde67a4a115612e3fb2360f44608910cd4cb4cb38232ad381ba80a572c4c27c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519184804/proof_0.1.0-main.20260519184804_darwin_amd64.tar.gz"
      sha256 "1cec56ba4ff457a23d35c26be61dcecf1cf10ae75cc2418e27837a948a15704e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519184804/proof_0.1.0-main.20260519184804_linux_arm64.tar.gz"
      sha256 "85087ef2d29e744c0d7441d50edb4528331c06072ff0fce20efc57c3cfcb2065"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260519184804/proof_0.1.0-main.20260519184804_linux_amd64.tar.gz"
      sha256 "24ef4dc5907bbb107a988c2a03b1e7f033a3140bf83b24545ceee04f50c694e7"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260519184804", output
  end
end
