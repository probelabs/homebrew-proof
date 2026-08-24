class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260824094940"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824094940/proof_0.1.0-main.20260824094940_darwin_arm64.tar.gz"
      sha256 "6bee5370e6ea65fedc956670a7fda316406641d5acb369cb9c0a7963aa63973f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824094940/proof_0.1.0-main.20260824094940_darwin_amd64.tar.gz"
      sha256 "a2f4d03b50bac580e075745e9fa18d8d7a696bdbf25ef24b864660267c6af336"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824094940/proof_0.1.0-main.20260824094940_linux_arm64.tar.gz"
      sha256 "31bd01ecc0dfa0f60f02ada2e4975b8fd1b4f93d77e89ae4ed6d5b64e8eed86f"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824094940/proof_0.1.0-main.20260824094940_linux_amd64.tar.gz"
      sha256 "5bdaaa963263d936debb4043d26299b642427a18905723e15c3d2410cd95e136"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260824094940", output
  end
end
