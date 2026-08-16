class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260816114806"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816114806/proof_0.1.0-main.20260816114806_darwin_arm64.tar.gz"
      sha256 "bf63179b95975d6ee2412deff8955f62e906194c00be645530a880fc2781980f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816114806/proof_0.1.0-main.20260816114806_darwin_amd64.tar.gz"
      sha256 "c51e91bfc241a54c82e2d3326d276004e679306a1fe2fa72edbafd8d08dd9e85"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816114806/proof_0.1.0-main.20260816114806_linux_arm64.tar.gz"
      sha256 "62a46692b3746ddcfd401adade179b0985d67e490dcdb4fc0858dc0761255e5d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260816114806/proof_0.1.0-main.20260816114806_linux_amd64.tar.gz"
      sha256 "baac7562bcaaa7e141ff4e7a0939a7a482b7f30983f13f30cfd20c16a582316e"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260816114806", output
  end
end
