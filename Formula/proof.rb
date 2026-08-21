class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260821104628"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821104628/proof_0.1.0-main.20260821104628_darwin_arm64.tar.gz"
      sha256 "472cbe795d77e3d50f0499e91fe44f4e0a458a161f221246e7ad7993a37a439a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821104628/proof_0.1.0-main.20260821104628_darwin_amd64.tar.gz"
      sha256 "320fd450781e704f5ef0ab50a1c8cbbcacc099d815ec009e7f6860b369667a5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821104628/proof_0.1.0-main.20260821104628_linux_arm64.tar.gz"
      sha256 "c80bd1cc4ece96fd8b8103b5c16fd5130164d709ddf4127057f22b74da21d3a6"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260821104628/proof_0.1.0-main.20260821104628_linux_amd64.tar.gz"
      sha256 "aac6e43a5bd92a53fba761d3e09d7a257b2bb169929f4bf76d5e9a69c0c5a2a0"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260821104628", output
  end
end
