class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260516173457"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260516173457/proof_0.1.0-main.20260516173457_darwin_arm64.tar.gz"
      sha256 "d15dbb50b9d09026882b10503c726e33a6bfc80a3ba44884728dc61ae5b85b54"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260516173457/proof_0.1.0-main.20260516173457_darwin_amd64.tar.gz"
      sha256 "eef9befc6f86682b5c1c176d8dcbd61ef1502f849590d096ce2ef624d328bba8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260516173457/proof_0.1.0-main.20260516173457_linux_arm64.tar.gz"
      sha256 "bd99d7b65f512bf9a5688502f8eb18ed0fb97711993abb8ed4284e77f4fcf6d5"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260516173457/proof_0.1.0-main.20260516173457_linux_amd64.tar.gz"
      sha256 "bf1b795f5e5086bcbc87e7cc3a6987da688e389e0b25bddfb305caae1e6932dc"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260516173457", output
  end
end
